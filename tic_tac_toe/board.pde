class Board {
  private int input = 9;
  private Shapes myShapes = new Shapes();
  private int [] squaresOnTheBoard = {0, 0, 0, 0, 0, 0, 0, 0, 0};
  
  Board() {
  }
  
  void placeInitialComputerMove() {
    int firstPlayForComputer = int(random(8));
    myShapes.drawShape("x", firstPlayForComputer);
    squaresOnTheBoard[firstPlayForComputer] = 2;
  }
  
  private Integer testForEndOfGame(){  //determines if game is finished
    int winningIndex = 3;      //0:game continues  1:user wins  2:computer wins  3:board full
    
    //checks if board is full
    for(int currentSquare = 0; currentSquare < 9; currentSquare++) {
      if(squaresOnTheBoard[currentSquare] == 0) {
        winningIndex = 0;
      }
    }
    
    for(int currentWinningCombo = 0; currentWinningCombo < 8; currentWinningCombo++) {
      if((squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 1) && (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][1]] == 1) && (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][2]] == 1)) {
        winningIndex = 1;
      }

      if((squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 2) && (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][1]] == 2) && (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][2]] == 2)) {
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
    switch(testForEndOfGame()) {
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
      for(int currentWinningCombo = 0; currentWinningCombo < 8; currentWinningCombo++) {
        int numberOfXsInThisWinningCombo = 0;
        possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][0];
        
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][1];
        }
        
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][1]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][2];
        }
        
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][2]] == 2) {
          numberOfXsInThisWinningCombo++;
          possibleNextPlay = (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 2) ? (WINNINGCOMBINATIONS[currentWinningCombo][1]) : (WINNINGCOMBINATIONS[currentWinningCombo][0]);
        }
        
        if((numberOfXsInThisWinningCombo == 2) && (squaresOnTheBoard[possibleNextPlay] == 0)) {
          nextPlayForComputer = possibleNextPlay;
        }
      }
    }
      
    //if cannot win, block user
    if(nextPlayForComputer == 9) {
      for(int currentWinningCombo = 0; currentWinningCombo < 8; currentWinningCombo++) {
        int numberOfOsInThisWinningCombo = 0;
        int possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][0];
      
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][1];
        }
        
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][1]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = WINNINGCOMBINATIONS[currentWinningCombo][2];
        }
        
        if(squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][2]] == 1) {
          numberOfOsInThisWinningCombo++;
          possibleNextPlay = (squaresOnTheBoard[WINNINGCOMBINATIONS[currentWinningCombo][0]] == 1) ? (WINNINGCOMBINATIONS[currentWinningCombo][1]) : (WINNINGCOMBINATIONS[currentWinningCombo][0]);
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
