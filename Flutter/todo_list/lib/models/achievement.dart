import 'package:todo_list/enums/achievement_type.dart';

class Achievement {
  final String id;
  final String title;
  final AchievementType type;
  final String description;
  final String icon;

  Achievement({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.icon,
  });

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      id: map["id"],
      title: map["title"],
      type: map["type"],
      description: map["description"],
      icon: map["icon"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "type": type,
      "description": description,
      "icon": icon,
    };
  }
}
