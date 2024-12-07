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
  int keyValue;

  if(keyPressed) {
    keyValue = key - '0';
    if(0 <= keyValue && keyValue < 9) {
      input = keyValue;
    } else {
      input = 9;
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
