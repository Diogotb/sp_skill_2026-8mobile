import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/filme.dart';

class FilmeController{
  Future<List<Filme>> getFilmes() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=a3fdce28f42e800b6e80f97aacf5f0f4'),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body) as Map<String, dynamic>);
      final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = data['results'] as List<dynamic>;
      return results.map((filmeJson) => Filme.fromJson(filmeJson as Map<String, dynamic>)).toList();
    }
    else {
      throw Exception("Falha ao carregar filme!");
    }
  }


}
