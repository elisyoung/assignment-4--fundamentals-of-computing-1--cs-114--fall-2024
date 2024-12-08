class Shapes {
  Shapes() {
  }
  
  void drawBoard() {
    line((BOARDSIZE/3), 0, (BOARDSIZE/3), (BOARDSIZE));
    line((BOARDSIZE * 2 / 3), 0, (BOARDSIZE * 2 / 3), BOARDSIZE);
    line(0, (BOARDSIZE/3), BOARDSIZE, (BOARDSIZE/3));
    line(0, (BOARDSIZE * 2 / 3), BOARDSIZE, (BOARDSIZE * 2 / 3));
    line(0, 0, 0, BOARDSIZE);
    line(0, 0, BOARDSIZE, 0);
    line(BOARDSIZE, 0, BOARDSIZE, BOARDSIZE);
    line(0, BOARDSIZE, BOARDSIZE, BOARDSIZE);
  }
  
  void drawShape(String shapeType, int locationOfShape){
    int rightSideOfSquareX = (BOARDSIZE / 3) * ((locationOfShape % 3) + 1) - 10;
    int leftSideOfSquareX = (BOARDSIZE / 3) * ((locationOfShape % 3)) + 10;
    int topSideOfSquareY = (BOARDSIZE / 3) * (locationOfShape / 3) + 10;
    int bottomSideOfSquareY = (BOARDSIZE / 3) * ((locationOfShape / 3) + 1) - 10;
    int middleOfSquareX = (rightSideOfSquareX + leftSideOfSquareX) / 2;
    int middleOfSquareY = (topSideOfSquareY + bottomSideOfSquareY) / 2;
    
    switch(shapeType) {
      case "X":
      case "x":
        line(leftSideOfSquareX, topSideOfSquareY, rightSideOfSquareX, bottomSideOfSquareY);
        line(rightSideOfSquareX, topSideOfSquareY, leftSideOfSquareX, bottomSideOfSquareY);
        
        break;
      
      case "O":
      case "o":
      case "0":
        circle(middleOfSquareX, middleOfSquareY, BOARDSIZE/3 - 20);
        
        break;
    }
  }
}
