Shapes myShapes = new Shapes();
Board myBoard = new Board();
int [] squaresOnTheBoard = {0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  size(500, 500);
  
  myBoard.drawBoard();
  
  int firstPlayForComputer = int(random(8));
  myShapes.drawShape("x", firstPlayForComputer);
  squaresOnTheBoard[firstPlayForComputer] = 2;
}

void draw(){
}

void keyPressed() {
  int nextPlayForComputer;
  boolean computerWins = false;
  boolean userWins = false;
  int input = 9;

  if(keyPressed) {
    switch(key) {
      case '0':
        input = 0;
        
        break;
      
      case '1':
        input = 1;
        
        break;
      
      case '2':
        input = 2;
        
        break;
        
      case '3':
        input = 3;
        
        break;
        
      case '4':
        input = 4;
        
        break;
        
      case '5':
        input = 5;
        
        break;
        
      case '6':
        input = 6;
        
        break;
        
      case '7':
        input = 7;
        
        break;
        
      case '8':
        input = 8;
        
        break;
      
      default:
        input = 9;
        
        break;
    }
    
    if(input < 9 && squaresOnTheBoard[input] == 0 && (myBoard.testForEndOfGame() == 0)) {
    //draws an O indicating the user's play
      myShapes.drawShape("O", input);
      squaresOnTheBoard[input] = 1;
      input = 9;
      
      if(myBoard.testForEndOfGame() == 0) {
      //computer makes the next move
        nextPlayForComputer = 9;
        while(nextPlayForComputer == 9) {
          int randomNumber = int(random(8));
          if(squaresOnTheBoard[randomNumber] == 0) {
            nextPlayForComputer = randomNumber;
          }
        }
        
        myShapes.drawShape("x", nextPlayForComputer);
        squaresOnTheBoard[nextPlayForComputer] = 2;
      }
      
    //checks for wins
    switch((myBoard.testForEndOfGame())) {
      case 1:
        println("game complete, user won");
        
        break;
        
      case 2:
        println("game complete, computer won");
        
        break;
        
      case 3:
        println("game complete, no winner");
        
      default:
        println("game still in progress");
    }
      
    } else {
        if(myBoard.testForEndOfGame() == 0) {
          println("invalid input");
        } else {
          println("game is complete");
        }
    }
  }
}
