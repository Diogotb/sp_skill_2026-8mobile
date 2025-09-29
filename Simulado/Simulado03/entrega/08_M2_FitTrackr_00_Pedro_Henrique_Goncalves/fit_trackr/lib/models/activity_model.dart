import 'package:fit_trackr/core/enums/activity_type_enum.dart';

class Activity{
  String? id;
  String userId;
  ActivityType type;
  String duration;
  double? distance;
  int caloriesBurned;
  DateTime createdAt;

  Activity({
    this.id,
    required this.userId,
    required this.type,
    required this.duration,
    this.distance,
    required this.caloriesBurned,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    final data = {
      'userId': userId,
      'type': type.toString(),
      'duration': duration,
      'distance': distance,
      'caloriesBurned': caloriesBurned,
      'createdAt': createdAt.toIso8601String(),
    };

    if (id != null) data['id'] = id;

    return data;
  }
}