import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/models/achievement.dart';
import 'package:todo_list/models/user_achievement.dart';

class UserProfile {
  final String uid;
  final int level;
  final int exp;
  final int coins;
  final int streakDays;
  final DateTime?lastCompletionDate;
  final List<String> unlockedSkins;
  final List<UserAchievement> achievements;

  UserProfile({
    required this.uid,
    this.level = 1,
    this.exp = 0,
    this.coins = 0,
    this.streakDays = 0,
    this.lastCompletionDate,
    this.unlockedSkins = const ["default"],
    this.achievements = const []
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map["uid"],
      level: map["level"] ?? 1,
      exp: map["exp"] ?? 0,
      coins: map["coins"] ?? 0,
      streakDays: map["streakDays"] ?? 0,
      lastCompletionDate: map['lastCompletionDate'] != null
          ? (map['lastCompletionDate'] as Timestamp).toDate()
          : null,
      unlockedSkins: List<String>.from(map['unlockedSkins'] ?? ["default"]),
      achievements: (map["achievements"] as List<dynamic>? ?? [])
          .map((e) => UserAchievement.fromMap(e))
          .toList(),

    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "level": level,
      "exp": exp,
      "coins": coins,
      "streakDays": streakDays,
      "lastCompletionDate": lastCompletionDate != null
          ? Timestamp.fromDate(lastCompletionDate!)
          : null,
      "unlockedSkins": unlockedSkins,
      "achievements": achievements,
    };
  }
}
