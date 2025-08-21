import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gamedex/models/user.dart';

class UserService {
  static const String baseUrl = 'http://10.0.2.2:3000/users';

  // Buscar todos os usuários
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar usuários');
    }
  }

  // Buscar um usuário por ID
  Future<User> fetchUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Usuário não encontrado');
    }
  }

  // Criar novo usuário
  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao criar usuário');
    }
  }

  // Atualizar usuário
  Future<User> updateUser(User user) async {
    if (user.id == null) {
      throw Exception('ID do usuário é obrigatório para atualização');
    }

    final response = await http.put(
      Uri.parse('$baseUrl/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao atualizar usuário');
    }
  }

  // Deletar usuário
  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar usuário');
    }
  }
}
