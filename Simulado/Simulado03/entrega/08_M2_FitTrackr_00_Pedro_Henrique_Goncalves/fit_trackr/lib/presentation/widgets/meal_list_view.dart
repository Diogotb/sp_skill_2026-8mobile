import 'package:flutter/material.dart';

class MealListView extends StatelessWidget {
  final List<Map<String, dynamic>> meals = const [
    {
      "id": 201,
      "type": "Café da Manhã",
      "foodItems": [
        {"name": "Ovo Cozido", "quantity": 2, "calories": 156},
        {"name": "Pão Integral", "quantity": 1, "calories": 80},
      ],
    },
    {
      "id": 202,
      "type": "Almoço",
      "foodItems": [
        {"name": "Peito de Frango Grelhado (100g)", "quantity": 1.5, "calories": 248},
        {"name": "Arroz Integral (100g)", "quantity": 1, "calories": 111},
        {"name": "Brócolis Cozido (100g)", "quantity": 1, "calories": 35},
      ],
    },
    {
      "id": 203,
      "type": "Jantar",
      "foodItems": [
        {"name": "Salmão Grelhado (100g)", "quantity": 1, "calories": 208},
        {"name": "Salada Verde com Azeite", "quantity": 1, "calories": 150},
      ],
    },
  ];

  const MealListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        final foodItems = meal['foodItems'] as List<dynamic>;

        final int totalCalories =
        foodItems.fold(0, (sum, item) => sum + item['calories'] as int);

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
                      meal['type'],
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
                ...foodItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${item['quantity']} x ${item['name']}",
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${item['calories']} Kcal",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
