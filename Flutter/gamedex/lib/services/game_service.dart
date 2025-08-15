import 'dart:convert';

import 'package:gamedex/models/game.dart';
import 'package:http/http.dart' as http;

class GameService {
  Future<List<Game>> fetchGames() async{
    final response = await http.get(
      Uri.parse('http://10.0.2.2:3000/games')
    );

    if (response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Game.fromJson(json)).toList();
    } else
      throw Exception("Erro ao carregar jogo");
  }

  Future<Game> fetchGameById(String id) async {
    final response = await http.get(
       Uri.parse('http://10.0.2.2:3000/games/5')
    );

    if (response.statusCode == 200){
      return Game.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Não foi encontrado");
    }
  }

  Future<void> toggleFavorite(String id, bool isFavorite) async {
    final url = Uri.parse('http://10.0.2.2:3000/games/$id');
    final response = await http.patch(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"isFavorite": isFavorite}),
    );

    if (response.statusCode == 200) {
      print('Favorito atualizado com sucesso!');
    } else {
      print('Erro ao atualizar favorito: ${response.statusCode}');
    }
  }


  Future<Game> createGame(Game game) async{
    final response = await http.post(
      Uri.parse('http://10.0.0.2.2:3000/games'),
      body: jsonEncode(game.toJson())
    );

    if (response.statusCode == 201){
      return Game.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else{
      throw Exception("Erro ao criar jogo");
    }
  }

  void toggleCollection(String id, bool isOnCollection) async {
    final url = Uri.parse('http://10.0.2.2:3000/games/$id');
    final response = await http.patch(
      url,
      body: jsonEncode({"inCollection": isOnCollection}),
    );

    if (response.statusCode == 200) {
      print('Coleção atualizada com sucesso!');
    } else {
      print('Erro ao atualizar coleção: ${response.statusCode}');
    }
  }
}