import 'package:isar/isar.dart';

part 'game.g.dart';

@collection
class Game {
  Id id = Isar.autoIncrement;
  String? title;
  String? genero;
  double rating = 0;
}