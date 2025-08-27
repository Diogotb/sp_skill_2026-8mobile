import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Position position;
  Orientation orientation;
  Robot(this.position, this.orientation);

  void move(String s) {
    for(int i=0; i < s.length; i++){
      String command = s[i];

        switch (command){
          case "R":
            int currentIndex = orientation.index;
            orientation = Orientation.values[currentIndex == 3 ? currentIndex = 0 : currentIndex + 1];
            break;

          case "L":
            int currentIndex = orientation.index;
            orientation = Orientation.values[currentIndex == 0 ? currentIndex = 3 : currentIndex - 1];
            break;

          case "A":
            switch (orientation){
              case Orientation.north:
                position = Position(position.x, position.y + 1);
                break;

              case Orientation.east:
                position = Position(position.x + 1, position.y);
                break;

              case Orientation.south:
                position = Position(position.x, position.y - 1);
                break;

              case Orientation.west:
                position = Position(position.x - 1, position.y);
                break;
            }
            break;
          case "_":
            throw ArgumentError("invalid command");
        }
    }
  }
}
