import 'package:flutter/material.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/services/game_service.dart';

class GameProvider with ChangeNotifier {
  final GameService _gameService = GameService();

  List<Game> _games = [];
  bool _isLoading = false;
  List<Game> _filteredGames = [];

  bool _isSearching = false;

  bool get isSearching => _isSearching;

  List<Game> get games => _filteredGames;
  bool get isLoading => _isLoading;

  Future<void> loadGames() async {
    _isLoading = true;
    notifyListeners();

    try {
      _games = await _gameService.fetchGames();
    } catch (e) {
      print("Erro: $e");
    }

    _filteredGames = [..._games];
    _isLoading = false;
    notifyListeners();
  }

  void searchGames(String query) {
    _isSearching = query.trim().isNotEmpty;

    if (!_isSearching) {
      _filteredGames = [..._games];
    } else {
      _filteredGames = _games.where(
            (game) =>
        game.title.toLowerCase().contains(query.toLowerCase()) ||
            game.genero.toLowerCase().contains(query.toLowerCase()),
      ).toList();
    }

    notifyListeners();
  }

}
