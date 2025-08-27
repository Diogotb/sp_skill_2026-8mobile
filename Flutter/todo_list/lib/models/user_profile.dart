import 'package:todo_list/models/achievement.dart';

class User {
  final String uid;
  final int level;
  final int exp;
  final int coins;
  final int streakDays;
  final DateTime lastCompletionDate;
  final List<String> unlockedSkins;
  final List<Achievement> achievements;

  User({
    required this.uid,
    required this.level,
    required this.exp,
    required this.coins,
    required this.streakDays,
    required this.lastCompletionDate,
    required this.unlockedSkins,
    required this.achievements,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map["uid"],
      level: map["level"],
      exp: map["exp"],
      coins: map["coins"],
      streakDays: map["streakDays"],
      lastCompletionDate: map["lastCompletionDate"],
      unlockedSkins: map["unlockedSkins"],
      achievements: map["achievements"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "uid": uid,
      "level": level,
      "exp":exp,
      "coins":coins,
      "streakDays": streakDays,
      "lastCompletionDate": lastCompletionDate,
      "unlockedSkins": unlockedSkins,
      "achievements": achievements,
    };
  }
}
