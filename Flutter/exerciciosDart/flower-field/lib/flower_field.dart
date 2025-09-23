class FlowerField {
  final List<String> list;
  FlowerField(this.list);

  get annotated => generateFlowerField();

  List<String> generateFlowerField(){
    List<List<String>> grid = list.map((row) => row.split("")).toList();

    for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[i].length; j++){
        if(grid[i][j] == "*"){
          incrementNeighbors(grid, i, j);
        }
      }
    }

    return grid.map((e) => e.join(""),).toList();
  }

  incrementNeighbors(List<List<String>> grid, int row, int col){
    for (int i = row -1; i <= row+1; i++){
      for (int j = col - 1; j <= col+1; j++){
        if(!(i==row && j==col)) increment(grid, i, j);
      }
    }
  }

  increment(List<List<String>> grid, int row, int col){
    if(row < 0 || row >= grid.length) return;
    if(col < 0 || col >= grid[row].length) return;

    if(grid[row][col] == "*") return;

    if(grid[row][col] == " "){
      grid[row][col] = "1";
    } else{
      grid[row][col] = (int.parse(grid[row][col]) + 1).toString();
    }
  }
}
