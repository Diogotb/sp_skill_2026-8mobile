import 'dart:convert';

import 'package:http/http.dart' as http;

import '../auth/models/user_model.dart';

class UserService{
  Future<User> getUserById(String id) async{
    try {
      final response = await http.get(Uri.parse("http://10.0.2.2:3000/users/$id"));
      if(response.statusCode == 200){
        return User.fromMap(jsonDecode(response.body));
      }else{
        throw Exception('Usuário não encontrado');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

}