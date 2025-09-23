class UserAchievement {
  final String achievementId; // referencia para o doc do achievement
  final bool unlocked;
  final DateTime? unlockedAt;

  UserAchievement({
    required this.achievementId,
    required this.unlocked,
    required this.unlockedAt,
  });

  factory UserAchievement.fromMap(Map<String, dynamic> map) {
    return UserAchievement(
      achievementId: map["achievementId"],
      unlocked: map["unlocked"],
      unlockedAt: map["unlockedAt"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "achievementId": achievementId,
      "unlocked": unlocked,
      "unlockedAt": unlockedAt
    };
  }
}
