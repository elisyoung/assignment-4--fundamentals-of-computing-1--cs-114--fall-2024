Shapes myShapes = new Shapes();
Board myBoard = new Board();
int [] squaresOnTheBoard = {0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  size(500, 500);
  background(150, 150, 250);
  strokeWeight(10);
  stroke(100, 100, 200);
  
  myShapes.drawBoard();
  
  stroke(255, 255, 255);
  noFill();
  
  int firstPlayForComputer = int(random(8));
  myShapes.drawShape("x", firstPlayForComputer);
  squaresOnTheBoard[firstPlayForComputer] = 2;
}

void draw(){
}

void keyPressed() {
  myBoard.playUserMove();
}
