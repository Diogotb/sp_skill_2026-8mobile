import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ActivityType { swimming, gym, running, biking }

class ActivitySelector extends StatefulWidget {
  @override
  _ActivitySelectorState createState() => _ActivitySelectorState();
}

class _ActivitySelectorState extends State<ActivitySelector> {
  ActivityType? selectedActivity;

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).colorScheme.primary;
    final colorInactive = Colors.grey;

    final activityIcons = {
      ActivityType.swimming: {
        'filled': 'assets/icons/swimmer_filled.svg',
        'outlined': 'assets/icons/swimmer_outlined.svg',
      },
      ActivityType.gym: {
        'filled': 'assets/icons/gym_filled.svg',
        'outlined': 'assets/icons/gym_outlined.svg',
      },
      ActivityType.running: {
        'filled': 'assets/icons/running_filled.svg',
        'outlined': 'assets/icons/running_outlined.svg',
      },
      ActivityType.biking: {
        'filled': 'assets/icons/biking_filled.svg',
        'outlined': 'assets/icons/biking_outlined.svg',
      },
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Escolha o tipo de atividade",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ActivityType.values.map((activity) {
            final isSelected = selectedActivity == activity;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedActivity = activity;
                });
              },
              child: SvgPicture.asset(
                isSelected
                    ? activityIcons[activity]!['filled']!
                    : activityIcons[activity]!['outlined']!,
                color: isSelected ? colorPrimary : colorInactive,
                width: 48,
                height: 48,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
