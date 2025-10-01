import 'meal_item.dart';

class Meal {
  final String? id;
  final String userId;
  final String type;
  final DateTime date;
  final List<MealItem> foodItems;

  Meal({
    this.id,
    required this.userId,
    required this.type,
    required this.date,
    required this.foodItems,
  });

  double get totalCalories =>
      foodItems.fold(0, (sum, item) => sum + item.totalCalories);

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] is String ? int.parse(map['id']) : map['id'],
      userId: map['userId'],
      type: map['type'],
      date: DateTime.parse(map['date']),
      foodItems: map['foodItems'] != null
          ? List<MealItem>.from(
          map['foodItems'].map((item) => MealItem.fromMap(item)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'type': type,
      'date': date.toIso8601String(),
      'foodItems': foodItems.map((item) => item.toMap()).toList(),
    };
  }
}