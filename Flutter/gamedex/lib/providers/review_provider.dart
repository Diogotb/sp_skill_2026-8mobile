import 'package:flutter/foundation.dart';
import '../models/review.dart';
import '../services/review_service.dart';

class ReviewProvider with ChangeNotifier {
  final ReviewService _reviewService = ReviewService();

  List<Review> _reviews = [];
  bool _isLoading = false;
  Stream<List<Review>>? _reviewStream;
  Stream<List<Review>> get reviewStream => _reviewStream!;

  List<Review> get reviews => _reviews;
  bool get isLoading => _isLoading;

  void listenToReviews(String gameId) {
    _isLoading = true;
    notifyListeners();

    _reviewStream = _reviewService.listenToReviews(gameId);

    _reviewStream!.listen((reviews) {
      _reviews = reviews;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addReview(Review review) async {
    await _reviewService.createReview(review);
    _reviews.insert(0, review);
    notifyListeners();
  }
}
