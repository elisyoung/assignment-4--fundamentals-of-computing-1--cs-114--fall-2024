class Board {
  int input = 9;
  
  Board() {
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
  
  boolean checkIfKeyPressedIsValid() {
    boolean keyIsValid;
    int keyValue = key - '0';
      if((0 <= keyValue) && (keyValue < 9) && (squaresOnTheBoard[keyValue] == 0)) {
        keyIsValid = true;
        input = keyValue;
      } else {
        keyIsValid = false;
        input = 9;
      }
      
      return keyIsValid;
  }
  
  void printGameStatus() {
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
        
        break;
        
      default:
        println("game still in progress");
        
        break;
    }
  }
  
  
  void placeUserMove() {
    //draws an O indicating the user's play
    myShapes.drawShape("O", input);
    squaresOnTheBoard[input] = 1;  //locations with an O are labeled with the value 1 in the arrary
    input = 9;
  }
  
  
  void placeComputerMove() {
    //determines the best move for the computer
    int nextPlayForComputer = 9;
    
    //win if possible
    if(nextPlayForComputer == 9){
      int possibleNextPlay;
      for(int i = 0; i < 8; i++) {
        int numberOfXsInThisWinningCombo = 0;
        possibleNextPlay = winningCombinations[i][0];
        
        if(squaresOnTheBoard[winningCombinations[i][0]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = winningCombinations[i][1];
        }
        
        if(squaresOnTheBoard[winningCombinations[i][1]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = winningCombinations[i][2];
        }
        
        if(squaresOnTheBoard[winningCombinations[i][2]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = (squaresOnTheBoard[winningCombinations[i][0]] == 2) ? (winningCombinations[i][1]) : (winningCombinations[i][0]);
        }
        
        if((numberOfXsInThisWinningCombo == 2) && (squaresOnTheBoard[possibleNextPlay] == 0)) {
          nextPlayForComputer = possibleNextPlay;
        }
      }
    }
      
    //if cannot win, block user
    if(nextPlayForComputer == 9) {
      for(int j = 0; j < 8; j++) {
        int numberOfOsInThisWinningCombo = 0;
        int possibleNextPlay = winningCombinations[j][0];
      
        if(squaresOnTheBoard[winningCombinations[j][0]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = winningCombinations[j][1];
        }
        
        if(squaresOnTheBoard[winningCombinations[j][1]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = winningCombinations[j][2];
        }
        
        if(squaresOnTheBoard[winningCombinations[j][2]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = (squaresOnTheBoard[winningCombinations[j][0]] == 1) ? (winningCombinations[j][1]) : (winningCombinations[j][0]);
        }
        
        if((numberOfOsInThisWinningCombo == 2) && (squaresOnTheBoard[possibleNextPlay] == 0)) {
          nextPlayForComputer = possibleNextPlay;
        }
      }
    }
    
    //if no winning or blocking, take middle square
    if((nextPlayForComputer == 9) && (squaresOnTheBoard[4] == 0)) {
      nextPlayForComputer = 4;
    }
    
    //if no winning, blocking, or middle, take a corner
    if(nextPlayForComputer == 9) {
      if(squaresOnTheBoard[0] == 0)
        nextPlayForComputer = 0;
      if(squaresOnTheBoard[2] == 0)
        nextPlayForComputer = 2;
      if(squaresOnTheBoard[6] == 0)
        nextPlayForComputer = 6;
      if(squaresOnTheBoard[8] == 0)
        nextPlayForComputer = 8;
    }
    
    //if none of above possible, pick random
    while((nextPlayForComputer == 9) || (squaresOnTheBoard[nextPlayForComputer] != 0)) {
      int randomNumber = int(random(8));
      if(squaresOnTheBoard[randomNumber] == 0) {
        nextPlayForComputer = randomNumber;
      }
    }
    
    //place X for computer move
    myShapes.drawShape("x", nextPlayForComputer);
    squaresOnTheBoard[nextPlayForComputer] = 2;   //locations with an X are labeled with the value 2 in the arrary
  }
}
