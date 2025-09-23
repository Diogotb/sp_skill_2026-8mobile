import 'dart:async';

class GameOfLife {
  late List<List<int>> initialMatrix;
  late List<List<int>> currentMatrix;
  int generation = 0;

  GameOfLife();

  List<List<int>> get matrix => currentMatrix;

  void load() {
    currentMatrix = initialMatrix
        .map(
          (e) => List<int>.from(e),
        )
        .toList();
    generation = 0;
  }

  List<List<int>> tick() {
    final List<List<int>> tempMatrix = [];

    for (int i = 0; i < currentMatrix.length; i++) {
      tempMatrix.add([]);
      for (int j = 0; j < currentMatrix[i].length; j++) {
        int neighborAmount = getNeighborAmount(i, j);
        bool shouldLive = decideFate(
            currentMatrix[i][j] == 1 ? true : false, i, j, neighborAmount);
        if (shouldLive) {
          tempMatrix[i].add(1);
        } else {
          tempMatrix[i].add(0);
        }
      }
    }

    generation += 1;
    currentMatrix = tempMatrix;
    return tempMatrix;
  }

  int getNeighborAmount(int row, int col) {
    int count = 0;
    for (int i = row - 1; i <= row + 1; i++) {
      for (int j = col - 1; j <= col + 1; j++) {
        if (i >= 0 &&
            i < currentMatrix.length &&
            j >= 0 &&
            j < currentMatrix[i].length &&
            !(i == row && j == col) &&
            currentMatrix[i][j] == 1) {
          count += 1;
        }
      }
    }
    return count;
  }

  bool decideFate(bool isAlive, int i, int j, int neighborAmount) {
    if (isAlive) {
      if (neighborAmount == 2 || neighborAmount == 3) {
        return true;
      } else {
        return false;
      }
    } else {
      if (neighborAmount == 3) {
        return true;
      } else {
        return false;
      }
    }
  }

  void printMatrix(List<List<int>> grid) {
    for (var row in grid) {
      print(row.map((e) => e == 1 ? '■' : '□').join(' '));
    }
  }

  void startGame(List<List<int>> initial, int generations, int duration) {
    initialMatrix = initial;
    int index = 0;
    load();

    Timer.periodic(
      Duration(seconds: duration),
      (timer) {
          index += 1;
          List<List<int>> grid = tick();
          print("=-=-=-=-=-=-=-=-= GENERATION $index =-=-=-=-=-=-=-=-=");
          printMatrix(grid);
          print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
          if (index >= generations) timer.cancel();
      },
    );

  }
}

void main() {
  final initial = [
    [1, 1, 0, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 0],
    [1, 0, 1, 1, 1, 1, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 1],
    [1, 1, 0, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 1, 0, 1, 0, 1]
  ];

  if (isSquare(initial)) {
    final game = GameOfLife();
    game.startGame(initial, 10, 2);
  } else {
    print("Não posso começar com uma matriz que não é quadrada! >:(");
  }
}

bool isSquare(List<List<int>> array) {
  if (array.isEmpty) return false;
  int rowCount = array.length;
  for (var row in array) {
    if (row.length != rowCount) {
      return false;
    }
  }
  return true;
}
