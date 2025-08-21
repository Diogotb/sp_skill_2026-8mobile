import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../models/review.dart';


class ReviewService {
  static const String baseUrl = 'http://10.0.2.2:3000/reviews';

  Future<List<Review>> fetchReviews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<dynamic> reviewsJson = data as List; //['reviews'];

      return reviewsJson.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception("Erro ao carregar reviews");
    }
  }

  Future<Review> fetchReviewById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Review não encontrada");
    }
  }

  Future<List<Review>> fetchReviewsByGameId(String gameId) async {
    final response = await http.get(Uri.parse('$baseUrl?gameId=$gameId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception("Erro ao carregar reviews do jogo");
      print("Erro ao carregar reviews do jogo");
    }
  }

  Future<Review> createReview(Review review) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(review.toJson(false)),
    );

    if (response.statusCode == 201) {
      return Review.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Erro ao criar review");
    }
  }
}
