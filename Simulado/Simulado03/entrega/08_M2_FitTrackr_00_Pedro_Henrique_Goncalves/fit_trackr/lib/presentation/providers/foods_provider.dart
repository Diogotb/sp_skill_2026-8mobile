import 'package:flutter/material.dart';
import 'package:fit_trackr/models/food_model.dart';
import 'package:fit_trackr/services/api_service.dart';

class FoodsProvider extends ChangeNotifier {
  List<Food> _foods = [];
  final _apiService = ApiService(baseUrl: "http://10.0.2.2:3000");

  bool _isLoading = false;

  List<Food> get foods => _foods;
  bool get isLoading => _isLoading;

  Future<void> fetchFoods() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.get("/foods");
      _foods = (response as List)
          .map((json) => Food.fromMap(json))
          .toList();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addFood(Food food) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.post("/foods", food.toMap());
      _foods.add(food);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateFood(Food food) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.put("/foods/${food.id}", food.toMap());
      final index = _foods.indexWhere((f) => f.id == food.id);
      if (index != -1) {
        _foods[index] = food;
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteFood(int foodId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.delete("/foods/$foodId");
      _foods.removeWhere((food) => food.id == foodId);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
