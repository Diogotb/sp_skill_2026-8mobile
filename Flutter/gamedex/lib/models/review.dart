import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamedex/models/user.dart';

class Review {
  String? id;
  final String userId;
  final String gameId;
  final String text;
  final double rating;
  final DateTime createdAt;

  Review({
    this.id,
    required this.userId,
    required this.gameId,
    required this.text,
    required this.rating,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      gameId: json['gameId'] ?? 0,
      text: json['text'] ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'gameId': gameId,
      'text': text,
      'rating': rating,
      'createdAt': createdAt,
    };
  }
}
