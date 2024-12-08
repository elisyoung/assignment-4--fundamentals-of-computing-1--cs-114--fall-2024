class Board {
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
  
  void nextMove() {
    int nextPlayForComputer;
    int input = 9;
    int keyValue;
  
    //checks if valid key is pressed and assigns value to input
    if(keyPressed) {
      keyValue = key - '0';
      if(0 <= keyValue && keyValue < 9) {
        input = keyValue;
      } else {
        input = 9;
      }
      
      if(input < 9 && squaresOnTheBoard[input] == 0 && (myBoard.testForEndOfGame() == 0)) {
        //draws an O indicating the user's play
        myShapes.drawShape("O", input);
        squaresOnTheBoard[input] = 1;
        input = 9;
        
        //if game continues, computer makes next move
        if(myBoard.testForEndOfGame() == 0) {
          nextPlayForComputer = 9;
          
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
              
              if(numberOfXsInThisWinningCombo == 2) {
                nextPlayForComputer = possibleNextPlay;
              }
            }
          }
            
          //if no win play, block user
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
              
              if(numberOfOsInThisWinningCombo == 2) {
                nextPlayForComputer = possibleNextPlay;
              }
            }
          }
          
          //if no win play or blocking, pick random
          while((nextPlayForComputer == 9) || (squaresOnTheBoard[nextPlayForComputer] != 0)) {
            int randomNumber = int(random(8));
            if(squaresOnTheBoard[randomNumber] == 0) {
              nextPlayForComputer = randomNumber;
            }
          }
          
          myShapes.drawShape("x", nextPlayForComputer);
          squaresOnTheBoard[nextPlayForComputer] = 2;
        }
        
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
      } else {
        if(myBoard.testForEndOfGame() == 0) {
          println("invalid input");
        } else {
          println("game is complete");
        }
      }
    }    
  }
}
