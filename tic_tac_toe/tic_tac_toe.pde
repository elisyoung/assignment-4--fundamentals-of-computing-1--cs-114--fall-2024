Shapes myShapes = new Shapes();
Board myBoard = new Board();
int [] squaresOnTheBoard = {0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  size(500, 500);
  background(150, 150, 250);
  strokeWeight(10);
  stroke(100, 100, 200);
  
  myBoard.drawBoard();
  
  stroke(255, 255, 255);
  noFill();
  
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


  //checks if valid key is pressed and assigns value to input
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
      
      //if game continues, computer makes next move
      if(myBoard.testForEndOfGame() == 0) {
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
      
    //checks for wins or board full
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
