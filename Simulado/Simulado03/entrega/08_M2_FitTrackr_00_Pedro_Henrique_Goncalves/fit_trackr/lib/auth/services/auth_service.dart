import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_service.dart';
import '../auth_provider.dart';
import '../models/user_model.dart';

class AuthService {
  final ApiService apiService = ApiService(baseUrl: "http://10.0.2.2:3000");
  static User? currentUser;

  Future<User?> login(String email, String password) async {
    try {
      final usersMap = await apiService.get("/users");

        for (var userJson in usersMap) {
          User user = User.fromMap(userJson);
          if (user.email == email && user.password == password) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("user_id", user.id.toString());
            currentUser = user;
            return user;
          }
        }
      return null;
    } catch (e) {
      print("Erro ao fazer login: $e");
      rethrow;
    }
  }

  Future<User?> register(String email, String password, String nome) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "name": nome,
        "avatarUrl": "https://i.pravatar.cc/150?u=$email",
        "goals":{
          "dailySteps": 0,
          "dailyCaloriesBurn": 0,
          "dailyCaloriesConsume": 0,
        }
      };

      final response = await apiService.post("/users", body);

      final user = User.fromMap(response);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("user_id", user.id.toString());
      currentUser = user;

      return user;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      rethrow;
    }
  }

  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
