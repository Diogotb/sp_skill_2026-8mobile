class UserGoals {
  int dailySteps;
  int dailyCaloriesBurn;
  int dailyCaloriesConsume;

  UserGoals({
    required this.dailySteps,
    required this.dailyCaloriesBurn,
    required this.dailyCaloriesConsume,
  });

  factory UserGoals.fromMap(Map<String, dynamic> map) {
    return UserGoals(
      dailySteps: map["dailySteps"],
      dailyCaloriesBurn: map["dailyCaloriesBurn"],
      dailyCaloriesConsume: map["dailyCaloriesConsume"],
    );
  }
}
