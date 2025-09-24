import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseListView extends StatelessWidget {
  final List<Map<String, String>> exercises = const [
    {
      'iconPath': 'assets/icons/biking_filled.svg',
      'description': '20 Km Ciclismo',
      'calories': '5Kcal'
    },
    {
      'iconPath': 'assets/icons/gym_filled.svg',
      'description': '1 Hora Academia',
      'calories': '2.5Kcal'
    },
    {
      'iconPath': 'assets/icons/running_filled.svg',
      'description': '5 Km Corrida',
      'calories': '5Kcal'
    },
    {
      'iconPath': 'assets/icons/swimmer_filled.svg',
      'description': '30 Min Natação',
      'calories': '1Kcal'
    },
  ];

  ExerciseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color errorColor = Theme.of(context).colorScheme.error;

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final Map<String, String> exercise = exercises[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  exercise['iconPath']!,
                  width: 36,
                  height: 36,
                  colorFilter:
                  ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    exercise['description']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  exercise['calories']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: errorColor,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/fire_filled.svg',
                  width: 24,
                  height: 24,
                  colorFilter:
                  ColorFilter.mode(errorColor, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}