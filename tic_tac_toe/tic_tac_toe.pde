Board myBoard = new Board();

void setup() {
  size(500, 500);
  background(150, 150, 250);
  strokeWeight(10);
  stroke(100, 100, 200);
  
  Shapes myShapes = new Shapes();
  myShapes.drawBoard();
  
  stroke(255, 255, 255);
  noFill();
  
  myBoard.placeInitialComputerMove();
}

void draw(){
}

void keyPressed() {
  if(keyPressed){
    if((myBoard.checkIfKeyPressedIsValid() == true) && (myBoard.testForEndOfGame() == 0)) {
      myBoard.placeUserMove();
      if(myBoard.testForEndOfGame() == 0) {
        myBoard.placeComputerMove();
      myBoard.printGameStatus();
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
