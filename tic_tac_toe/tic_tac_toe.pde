int input;
Shapes myShapes = new Shapes();
int [] squaresOnTheBoard = new int[9];
boolean gameIsComplete;

void setup() {
  size(500, 500);
  
  input = 9;
  
  Board myBoard = new Board();
  myBoard.drawBoard();
  
  int firstPlayForComputer = int(random(8));
  myShapes.drawShape("x", firstPlayForComputer);
  squaresOnTheBoard[firstPlayForComputer] = 2;
  
}

void draw() {
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
    
    if(input < 9 && squaresOnTheBoard[input] == 0) {
      myShapes.drawShape("O", input);
      println("you entered: " + input);
      squaresOnTheBoard[input] = 1;
      input = 9;
      
      gameIsComplete = true;
      
      for(int i = 0; i < 9; i++) {
        if(squaresOnTheBoard[i] == 0) {
          gameIsComplete = false;
        }
      }
    
      if(gameIsComplete) {
        println("game is complete");
      } else {
        println("game still in progress");
      }
      
    }
  }
}
