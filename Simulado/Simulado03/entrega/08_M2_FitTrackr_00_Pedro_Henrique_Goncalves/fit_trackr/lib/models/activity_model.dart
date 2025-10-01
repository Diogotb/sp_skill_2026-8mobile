import 'package:fit_trackr/core/enums/activity_type_enum.dart';

class Activity {
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
      'type': type.name,
      'duration': duration,
      'distance': distance,
      'caloriesBurned': caloriesBurned,
      'createdAt': createdAt.toIso8601String(),
    };

    if (id != null) data['id'] = id;

    return data;
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    final activityType = ActivityType.values.firstWhere(
          (e) => e.name == map["type"],
      orElse: () => ActivityType.corrida,
    );

    return Activity(
      id: map["id"],
      userId: map["userId"],
      type: activityType,
      duration: map["duration"].toString(),
      distance: (map["distance"] as num?)?.toDouble(),
      caloriesBurned: map["caloriesBurned"] ?? 0,
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }

}
