int input;

void setup() {
  size(500, 500);
  
  input = 9;
  
  Board myBoard = new Board();
  myBoard.drawBoard();
}

void draw() {
  Shapes myShapes = new Shapes();
  
  if(input < 9) {
    myShapes.drawShape("O", input);
    println("you entered: " + input);
    input = 9;
  }
}

void keyPressed() {
  if(input > 8) {
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
        println("you did not enter a valid number");
        
        break;
    }
  }
}
