import 'package:todo_list/enums/difficulty.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime? dueDate;
  final Difficulty difficulty;
  final bool completed;
  final DateTime? createdAt;
  final DateTime? completedAt;
  final String? repeat;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.difficulty,
    required this.completed,
    required this.createdAt,
    required this.completedAt,
    required this.repeat,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      dueDate: map["dueDate"],
      difficulty: map["difficulty"],
      completed: map["completed"],
      createdAt: map["createdAt"],
      completedAt: map["completedAt"],
      repeat: map["repeat"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "title":title,
      "description":description,
      "dueDate": dueDate,
      "difficulty": difficulty,
      "completed": completed,
      "createdAt": createdAt,
      "completedAt": completedAt,
      "repeat": repeat
    };
  }
}
