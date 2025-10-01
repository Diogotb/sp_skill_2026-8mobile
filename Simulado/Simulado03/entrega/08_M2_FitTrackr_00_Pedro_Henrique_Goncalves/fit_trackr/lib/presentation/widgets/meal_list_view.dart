import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit_trackr/models/meal_model.dart';

import '../providers/meals_provider.dart';

class MealListView extends StatelessWidget {
  const MealListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealsProvider>(context);

    if (mealsProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final meals = mealsProvider.meals;

    if (meals.isEmpty) {
      return const Center(child: Text("Nenhuma refeição registrada."));
    }

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final Meal meal = meals[index];
        final int totalCalories = meal.totalCalories.toInt();

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meal.type,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      "$totalCalories Kcal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                ...meal.foodItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${item.quantity} x ${item.food.name}",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${item.totalCalories.toInt()} Kcal",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
