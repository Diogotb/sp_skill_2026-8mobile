import 'package:flutter/material.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/services/game_service.dart';
import 'package:gamedex/services/user_game_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GameProvider with ChangeNotifier {
  final GameService _gameService = GameService();
  final UserGameService _userGameService = UserGameService();

  List<Game> _games = [];
  List<Game> _filteredGames = [];
  bool _isLoading = false;
  bool _isSearching = false;

  Set<String> _favoriteIds = {};
  Set<String> _collectionIds = {};

  bool get isLoading => _isLoading;
  bool get isSearching => _isSearching;
  List<Game> get games => _filteredGames;

  Future<void> loadGames() async {
    _isLoading = true;
    notifyListeners();

    try {
      _games = await _gameService.fetchGames();

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _favoriteIds = await _userGameService.fetchFavoriteIds();
        _collectionIds = await _userGameService.fetchCollectionIds();
      }

      _filteredGames = [..._games];
    } catch (e) {
      print("Erro ao carregar jogos: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(String gameId) async {
    await _userGameService.toggleFavorite(gameId);
    if (_favoriteIds.contains(gameId)) {
      _favoriteIds.remove(gameId);
    } else {
      _favoriteIds.add(gameId);
    }
    notifyListeners();
  }

  Future<void> toggleCollection(String gameId) async {
    await _userGameService.toggleCollection(gameId);
    if (_collectionIds.contains(gameId)) {
      _collectionIds.remove(gameId);
    } else {
      _collectionIds.add(gameId);
    }
    notifyListeners();
  }

  bool isFavorite(String gameId) => _favoriteIds.contains(gameId);
  bool isInCollection(String gameId) => _collectionIds.contains(gameId);


  void searchGames(String query) {
    _isSearching = query.trim().isNotEmpty;
    if (!_isSearching) {
      _filteredGames = [..._games];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredGames = _games.where((game) {
        return game.title.toLowerCase().contains(lowerQuery) ||
            game.genero.toLowerCase().contains(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }

  List<Game> get favoriteGames =>
      _games.where((game) => _favoriteIds.contains(game.id)).toList();

  List<Game> get collectionGames =>
      _games.where((game) => _collectionIds.contains(game.id)).toList();

  Future<Game?> getGameById(String id) async {
    try {
      return await _gameService.fetchGameById(id);
    } catch (e) {
      print("Erro ao buscar jogo: $e");
      return null;
    }
  }

  List<String> getFavoriteGenres() {
    final collectionGames = _games.where((g) => _collectionIds.contains(g.id)).toList();
    final Map<String, int> genreCount = {};
    for (var game in collectionGames) {
      genreCount[game.genero] = (genreCount[game.genero] ?? 0) + 1;
    }
    final sortedGenres = genreCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedGenres.take(3).map((e) => e.key).toList();
  }

  List<Game> getRecommendedGames() {
    final topGenres = getFavoriteGenres();
    final recommended = <Game>[];

    for (var game in _games) {
      if (recommended.length >= 10) break;
      if (topGenres.contains(game.genero) && !_collectionIds.contains(game.id)) {
        recommended.add(game);
      }
    }

    if (recommended.length < 10) {
      final remaining = _games
          .where((g) => !_collectionIds.contains(g.id) && !recommended.contains(g))
          .toList();
      remaining.sort((a, b) => b.rating.compareTo(a.rating));

      for (var game in remaining) {
        if (recommended.length >= 10) break;
        recommended.add(game);
      }
    }

    return recommended;
  }

  bool _isSearchingCollection = false;
  List<Game> _filteredCollectionGames = [];

  bool get isSearchingCollection => _isSearchingCollection;

  List<Game> get filteredCollectionGames =>
      _isSearchingCollection ? _filteredCollectionGames : collectionGames;

  void searchGamesInCollection(String query) {
    _isSearchingCollection = query.trim().isNotEmpty;

    final collectionList = collectionGames;

    if (!_isSearchingCollection) {
      _filteredCollectionGames = [...collectionList];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredCollectionGames = collectionList.where((game) {
        return game.title.toLowerCase().contains(lowerQuery) ||
            game.genero.toLowerCase().contains(lowerQuery);
      }).toList();
    }

    notifyListeners();
  }

}
