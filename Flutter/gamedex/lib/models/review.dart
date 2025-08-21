import 'package:gamedex/models/user.dart';

class Review {
  String? id;
  final String userId;
  final String gameId;
  final String text;
  final double rating;

  Review({this.id, required this.userId, required this.gameId,required this.text , required this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      gameId:json['gameId'] ?? 0,
      text: json['text'] ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }


  Map<String, dynamic> toJson(bool? id) {
    if (id!) {
      return {
        'id': id,
        'userId': userId,
        'gameId': gameId,
        'text': text,
        'rating': rating,
      };
    } else {
      return {
      'userId': userId,
      'gameId': gameId,
       'text': text,
      'rating': rating,
    };
    }
  }
}