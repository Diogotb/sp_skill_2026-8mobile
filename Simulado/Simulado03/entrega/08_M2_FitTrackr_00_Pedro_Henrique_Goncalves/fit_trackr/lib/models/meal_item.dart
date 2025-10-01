import 'food_model.dart';

class MealItem {
  final Food food;
  final double quantity;

  MealItem({
    required this.food,
    required this.quantity,
  });

  double get totalCalories => food.caloriesPerUnit * quantity;

  factory MealItem.fromMap(Map<String, dynamic> map) {
    return MealItem(
      food: Food.fromMap(map),
      quantity: map['quantity']?.toDouble() ?? 1.0,
    );
  }

  Map<String, dynamic> toMap() {
    final foodMap = food.toMap();
    foodMap['quantity'] = quantity;
    return foodMap;
  }
}