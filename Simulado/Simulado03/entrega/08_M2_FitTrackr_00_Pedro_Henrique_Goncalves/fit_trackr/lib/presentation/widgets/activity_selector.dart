import 'package:fit_trackr/core/enums/activity_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivitySelector extends StatefulWidget {
  final void Function(ActivityType) onActivityChanged; // callback para informar o valor selecionado
  final ActivityType initialActivity;

  ActivitySelector({
    Key? key,
    required this.onActivityChanged,
    this.initialActivity = ActivityType.corrida,
  }) : super(key: key);

  @override
  _ActivitySelectorState createState() => _ActivitySelectorState();
}

class _ActivitySelectorState extends State<ActivitySelector> {
  late ActivityType selectedActivity;

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.initialActivity; // inicializa com valor passado
  }

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).colorScheme.primary;
    final colorInactive = Colors.grey;

    final activityIcons = {
      ActivityType.natacao: {
        'filled': 'assets/icons/swimmer_filled.svg',
        'outlined': 'assets/icons/swimmer_outlined.svg',
      },
      ActivityType.musculacao: {
        'filled': 'assets/icons/gym_filled.svg',
        'outlined': 'assets/icons/gym_outlined.svg',
      },
      ActivityType.corrida: {
        'filled': 'assets/icons/running_filled.svg',
        'outlined': 'assets/icons/running_outlined.svg',
      },
      ActivityType.ciclismo: {
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
                widget.onActivityChanged(selectedActivity);
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
