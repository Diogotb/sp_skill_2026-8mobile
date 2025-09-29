import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../models/activity_model.dart';
import '../providers/activities_provider.dart';
import '../../core/enums/activity_type_enum.dart';

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({Key? key}) : super(key: key);

  String _formatActivityName(ActivityType type) {
    switch (type) {
      case ActivityType.ciclismo:
        return 'Ciclismo';
      case ActivityType.corrida:
        return 'Corrida';
      case ActivityType.natacao:
        return 'Natação';
      case ActivityType.musculacao:
        return 'Musculação';
      default:
        return 'Atividade';
    }
  }


  String _getIconPath(ActivityType type) {
    switch (type) {
      case ActivityType.ciclismo:
        return 'assets/icons/biking_filled.svg';
      case ActivityType.musculacao:
        return 'assets/icons/gym_filled.svg';
      case ActivityType.corrida:
        return 'assets/icons/running_filled.svg';
      case ActivityType.natacao:
        return 'assets/icons/swimmer_filled.svg';
      default:
        return 'assets/icons/unknown.svg';
    }
  }

  String _getDescription(Activity activity) {
    final activityName = _formatActivityName(activity.type);
    switch (activity.type) {
      case ActivityType.ciclismo:
      case ActivityType.corrida:
        return '${activity.distance} Km $activityName';
      default:
        return '${activity.duration} $activityName';
    }
  }


  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color errorColor = Theme.of(context).colorScheme.error;

    final activitiesProvider = Provider.of<ActivitiesProvider>(context);
    final List<Activity> activities = activitiesProvider.activities;

    if (activities.isEmpty) {
      return const Center(child: Text("Nenhuma atividade encontrada"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final Activity activity = activities[index];

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
                  _getIconPath(activity.type),
                  width: 36,
                  height: 36,
                  colorFilter: ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    _getDescription(activity),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  '${activity.caloriesBurned} Kcal',
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
                  colorFilter: ColorFilter.mode(errorColor, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
