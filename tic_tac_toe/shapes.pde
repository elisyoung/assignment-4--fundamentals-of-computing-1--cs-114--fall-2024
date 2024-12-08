class Shapes {
  Shapes() {
  }
  
  void drawBoard() {
    line((boardSize/3), 0, (boardSize/3), (boardSize));
    line((boardSize * 2 / 3), 0, (boardSize * 2 / 3), boardSize);
    line(0, (boardSize/3), boardSize, (boardSize/3));
    line(0, (boardSize * 2 / 3), boardSize, (boardSize * 2 / 3));
    line(0, 0, 0, boardSize);
    line(0, 0, boardSize, 0);
    line(boardSize, 0, boardSize, boardSize);
    line(0, boardSize, boardSize, boardSize);
  }
  
  void drawShape(String shapeType, int locationOfShape){
    int rightSideOfSquareX = (boardSize / 3) * ((locationOfShape % 3) + 1) - 10;
    int leftSideOfSquareX = (boardSize / 3) * ((locationOfShape % 3)) + 10;
    int topSideOfSquareY = (boardSize / 3) * (locationOfShape / 3) + 10;
    int bottomSideOfSquareY = (boardSize / 3) * ((locationOfShape / 3) + 1) - 10;
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
        circle(middleOfSquareX, middleOfSquareY, boardSize/3 - 20);
        
        break;
    }
  }
}
