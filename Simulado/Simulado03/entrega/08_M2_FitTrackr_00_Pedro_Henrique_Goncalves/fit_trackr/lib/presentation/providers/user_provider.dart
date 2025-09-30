import 'package:flutter/material.dart';

import '../../auth/models/user_model.dart';
import '../../models/goal_model.dart';
import '../../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  final _apiService = ApiService(baseUrl: "http://10.0.2.2:3000");
  User? get currentUser => _currentUser;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> updateGoals(UserGoals newGoals) async {
    if (_currentUser == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.put(
        "/users/${_currentUser!.id}",
        _currentUser!.copyWith(goals: newGoals).toMap(),
      );

      _currentUser = User.fromMap(response);

    } catch (e) {
      debugPrint("Erro ao atualizar metas: $e");

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateName(String newName) {
    if (_currentUser == null) return;
    _currentUser = _currentUser!.copyWith(name: newName);

    try{
      _apiService.put("/users/${_currentUser!.id}",_currentUser!.copyWith(name: newName).toMap());
    } catch(e){
      rethrow;
    }finally{
      notifyListeners();
    }
  }

  void updateEmail(String newEmail) {
    if (_currentUser == null) return;
    _currentUser = _currentUser!.copyWith(email: newEmail);

    try{
      _apiService.put("/users/${_currentUser!.id}",_currentUser!.copyWith(email: newEmail).toMap());
    } catch(e){
      rethrow;
    }finally{
      notifyListeners();
    }
  }

  void updateAvatar(String newAvatarUrl) {
    if (_currentUser == null) return;
    _currentUser = _currentUser!.copyWith(avatarUrl: newAvatarUrl);

    try{
      _apiService.put("/users/${_currentUser!.id}",_currentUser!.copyWith(avatarUrl: newAvatarUrl).toMap());
    } catch(e){
      rethrow;
    }finally{
      notifyListeners();
    }
  }

}
