import 'package:isar/isar.dart';

@collection
class User{
  Id id = Isar.autoIncrement;
  String? username;
  String? password;
}