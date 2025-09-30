import 'package:fit_trackr/presentation/providers/user_provider.dart';
import 'package:fit_trackr/models/activity_model.dart';
import 'package:fit_trackr/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitiesProvider extends ChangeNotifier{
  List<Activity> _activities = [];

  final _apiService = ApiService(baseUrl: "http://10.0.2.2:3000");

  bool _isLoading = false;

  List<Activity> get activities => _activities;

  bool get isLoading => _isLoading;

  Future<void> fetchActivities() async {
    _isLoading = true;
    notifyListeners();

    _activities = [];

    try {
      final _prefs = await SharedPreferences.getInstance();
      final response = await _apiService.get("/activities?userId=${_prefs.getString("user_id")}");
      _activities = (response as List)
          .map((json) => Activity.fromMap(json))
          .toList();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> addActivity (Activity activity) async{
    _isLoading = true;
    notifyListeners();
    try{
      await _apiService.post("/activities", activity.toMap());
      _activities.add(activity);
    }catch(e){
      rethrow;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

}