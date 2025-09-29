import 'package:fit_trackr/models/activity_model.dart';
import 'package:fit_trackr/services/api_service.dart';
import 'package:flutter/material.dart';

class ActivitiesProvider extends ChangeNotifier{
  List<Activity> _activities = [];

  final _apiService = ApiService(baseUrl: "http://10.0.2.2:3000");

  bool _isLoading = false;

  List<Activity> get activities => _activities;

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