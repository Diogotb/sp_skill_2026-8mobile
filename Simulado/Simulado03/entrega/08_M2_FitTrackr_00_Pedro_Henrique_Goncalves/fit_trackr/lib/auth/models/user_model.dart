import 'package:fit_trackr/models/goal_model.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  String avatarUrl;
  UserGoals goals;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatarUrl,
    required this.goals,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapGoals = map["goals"];
    UserGoals goals = UserGoals.fromMap(mapGoals);

    return User(
      id: map["id"].toString(),
      name: map["name"],
      email: map["email"],
      password: map["password"],
      avatarUrl: map["avatarUrl"],
      goals: goals,
    );
  }

  User copyWith({String? id, String? name, UserGoals? goals, String? email, String? password, String? avatarUrl}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      goals: goals ?? this.goals,
      password: password ?? this.password,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'password': password,
      'avatarUrl': avatarUrl,
      'goals': goals.toMap(),
    };
  }
}
