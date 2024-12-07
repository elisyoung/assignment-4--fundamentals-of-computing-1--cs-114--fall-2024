class Board {
  Board() {
  }
  
  void drawBoard() {
    line((boardSize/3), 0, (boardSize/3), (boardSize));
    line((boardSize * 2 / 3), 0, (boardSize * 2 / 3), boardSize);
    line(0, (boardSize/3), boardSize, (boardSize/3));
    line(0, (boardSize * 2 / 3), boardSize, (boardSize * 2 / 3));
  }
}
