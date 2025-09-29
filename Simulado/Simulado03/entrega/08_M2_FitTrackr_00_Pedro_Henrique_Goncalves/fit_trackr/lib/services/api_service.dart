import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url);
      final data = response.body;
      return jsonDecode(data);
    } catch (e) {
      throw Exception('Erro ao fazer GET: $e');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      final data = response.body;
      return jsonDecode(data);
    } catch (e) {
      throw Exception('Erro ao fazer POST: $e');
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      final data = response.body;
      return jsonDecode(data);
    } catch (e) {
      throw Exception('Erro ao fazer PUT: $e');
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.delete(url);
      final data = response.body;
      return jsonDecode(data);
    } catch (e) {
      throw Exception('Erro ao fazer DELETE: $e');
    }
  }

}
