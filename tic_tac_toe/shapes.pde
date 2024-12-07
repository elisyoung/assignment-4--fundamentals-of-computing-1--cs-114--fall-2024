class Shapes {
  Shapes() {
  }
  
  void drawShape(String shapeType, int locationOfShape){
    int rightSideX = (boardSize / 3) * ((locationOfShape % 3) + 1);
    int leftSideX = (boardSize / 3) * ((locationOfShape % 3));
    int topSideY = (boardSize / 3) * (locationOfShape / 3);
    int bottomSideY = (boardSize / 3) * ((locationOfShape / 3) + 1);
    int middleOfSquareX = (rightSideX + leftSideX) / 2;
    int middleOfSquareY = (topSideY + bottomSideY) / 2;
    
    switch(shapeType) {
      case "X":
      case "x":
        line(leftSideX, topSideY, rightSideX, bottomSideY);
        line(rightSideX, topSideY, leftSideX, bottomSideY);
        
        break;
      
      case "O":
      case "o":
      case "0":
        circle(middleOfSquareX, middleOfSquareY, boardSize/3);
        break;
    }
  }
  
}
