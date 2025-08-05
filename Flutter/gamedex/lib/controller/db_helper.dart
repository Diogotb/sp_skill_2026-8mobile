import 'package:gamedex/models/game.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  late Future<Isar> db;

  DBHelper(){
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([GameSchema, UserSchema], inspector: true,);
    }

    return Future.value(Isar.getInstance());
  }
}