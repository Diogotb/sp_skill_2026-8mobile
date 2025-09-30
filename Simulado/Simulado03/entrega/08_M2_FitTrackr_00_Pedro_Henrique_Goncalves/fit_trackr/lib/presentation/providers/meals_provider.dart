import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fit_trackr/models/meal_model.dart';
import 'package:fit_trackr/services/api_service.dart';

class MealsProvider extends ChangeNotifier {
  List<Meal> _meals = [];
  final _apiService = ApiService(baseUrl: "http://10.0.2.2:3000");

  bool _isLoading = false;

  List<Meal> get meals => _meals;
  bool get isLoading => _isLoading;

  Future<void> fetchMeals() async {
    _isLoading = true;
    notifyListeners();

    try {
      final _prefs = await SharedPreferences.getInstance();
      final userId = _prefs.getString("user_id");
      final response = await _apiService.get("/meals?userId=$userId");

      _meals = (response as List)
          .map((json) => Meal.fromMap(json))
          .toList();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addMeal(Meal meal) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.post("/meals", meal.toMap());
      _meals.add(meal);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMeal(Meal meal) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.put("/meals/${meal.id}", meal.toMap());
      final index = _meals.indexWhere((m) => m.id == meal.id);
      if (index != -1) {
        _meals[index] = meal;
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMeal(int mealId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.delete("/meals/$mealId");
      _meals.removeWhere((meal) => meal.id == mealId);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
