class Board {
  Board() {
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
  
  Integer testForEndOfGame(){  //determines if game is finished
    int winningIndex = 3;      //0:game continues  1:user wins  2:computer wins  3:board full
    
    for(int i = 0; i < 9; i++) {
      if(squaresOnTheBoard[i] == 0) {
        winningIndex = 0;
      }
    }
    
    for(int i = 0; i < 8; i++) {
      if((squaresOnTheBoard[winningCombinations[i][0]] == 1) && (squaresOnTheBoard[winningCombinations[i][1]] == 1) && (squaresOnTheBoard[winningCombinations[i][2]] == 1)) {
        winningIndex = 1;
      }

      if((squaresOnTheBoard[winningCombinations[i][0]] == 2) && (squaresOnTheBoard[winningCombinations[i][1]] == 2) && (squaresOnTheBoard[winningCombinations[i][2]] == 2)) {
        winningIndex = 2;
      }
    }
    
    return winningIndex;
  }
}
