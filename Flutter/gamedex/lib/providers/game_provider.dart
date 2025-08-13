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

  List<Game> get filteredCollectionGames {
    if (!_isSearching) {
      return _games.where((game) => game.inCollection).toList();
    }

    return _filteredGames.where((game) => game.inCollection).toList();
  }

  List<Game> get favoriteGames =>
      _games.where((game) => game.isFavorite).toList();

  List<Game> get fetchCollectionGames =>
      _games.where((game) => game.inCollection).toList();

  List<String> get fetchFavoriteGenres =>
      getFavoriteGenres();

  List<Game> get fetchRecommendedGames =>
      getRecommendedGames();

  List<Game> getRecommendedGames(){
    List<String> generosRecomendados = fetchFavoriteGenres;
    List<Game> jogosRecomendados = [];

    games.forEach((game) {
      if (!(jogosRecomendados.length >= 10)) {
        if(generosRecomendados.contains(game.genero) && !(game.inCollection)){
          jogosRecomendados.add(game);
        }
      }
    },);

    jogosRecomendados.sort((a, b) {
      return a.rating.compareTo(b.rating);
    });

    return jogosRecomendados;
  }

  List<String> getFavoriteGenres(){
      List<Game> collectionGames = fetchCollectionGames;
      List<String> genres = [];
      Map<String, int> ocurrences = {};
      List<dynamic> favoriteGenres = [];

      collectionGames.forEach((element) {
        genres.add(element.genero);
      },);

      genres.forEach((genre) {
        if (!ocurrences.containsKey(genre)) {
          ocurrences[genre] = 1;
        } else {
          ocurrences[genre] = ocurrences[genre]! + 1;
        }
      });

      favoriteGenres = [...ocurrences.entries];
      favoriteGenres.sort((a, b) {
        return a.value.compareTo(b.value);
      },);

      List<String> keys = [];
      int end = genres.length < 3 ? genres.length : 3;
      favoriteGenres.sublist(0, end).forEach((element) {
        keys.add(element.key);
      },);

      return keys;
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

  Future<Game>? getGameById(int id){
    final game = _gameService.fetchGameById(id);
    if (game != null){
      return game;
    } else {
      return null;
    }
  }

}
