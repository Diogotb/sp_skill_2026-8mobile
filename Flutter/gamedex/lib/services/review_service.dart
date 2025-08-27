import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review.dart';

class ReviewService {
  final _reviewsRef = FirebaseFirestore.instance.collection('reviews');

  Future<void> createReview(Review review) async {
    await _reviewsRef.doc(review.id).set(review.toJson());
  }

  Future<List<Review>> fetchReviewsByGame(String gameId) async {
    final snapshot = await _reviewsRef
        .where('gameId', isEqualTo: gameId)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList();
  }

  Stream<List<Review>> listenToReviews(String gameId) {
    return _reviewsRef
        .where('gameId', isEqualTo: gameId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList());
  }

  Stream<List<Review>> listenToReviewsByGameId(String gameId) {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('gameId', isEqualTo: gameId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList());
  }

}
