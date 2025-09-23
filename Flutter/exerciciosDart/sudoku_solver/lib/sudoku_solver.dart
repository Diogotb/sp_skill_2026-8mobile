bool isSafe(board, int row, int col, int num ){
  // Verifica linhas
  for (int i = 0; i < 9; i++){
    if(board[row][i] == num){
      return false;
    }
  }

  // Verifica colunas
  for (int i = 0; i < 9; i++){
    if(board[i][col] == num){
      return false;
    }
  }

  int startRow = row - (row % 3);
  int startCol = col - (col % 3);

  // Verifica 3x3
  for (int x=0; x < 3; x++){
    for(int y=0; y < 3; y++){
      if(board[x + startRow][y + startCol] == num){
        return false;
      }
    }
  }

  return true;
}

bool solveSudokuRecursive(board, row, col){
  if (row == 8 && col == 9){
    return true;
  }

  if (col == 9){
    row++;
    col = 0;
  }

  if(board[row][col] != 0){
    return solveSudokuRecursive(board, row, col + 1);
  }

  for(int num = 1; num <= 9; num++){
    if(isSafe(board, row, col, num)){
      board[row][col] = num;
      if(solveSudokuRecursive(board, row, col + 1)){
        return true;
      }
      board[row][col] = 0;
    }
  }
    return false;
}

void solve(board){
  solveSudokuRecursive(board, 0, 0);
}

