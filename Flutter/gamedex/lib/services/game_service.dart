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
      print('Jogos recebidos: $data');
      return data.map((json) => Game.fromJson(json)).toList();
    } else
      throw Exception("Erro ao carregar jogo");
  }

  Future<Game> fetchGameById(int id) async {
    final response = await http.get(
       Uri.parse('http://10.0.2.2:3000/games/$id')
    );

    if (response.statusCode == 200){
      return Game.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Não foi encontrado");
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
}