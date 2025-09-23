class User {
  final String? id;
  final String? username;
  final String? password;
  final String? avatarUrl;

  User({this.id, this.username, this.password, this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json, String id) {
    return User(
      id: id,
      username: json['username'],
      password: json['password'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'avatarUrl': avatarUrl,
    };
  }
}
