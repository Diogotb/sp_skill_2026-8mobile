import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/game.dart';

class GameService {
  final _db = FirebaseFirestore.instance;

  // Get all games
  Future<List<Game>> fetchGames() async {
    final snapshot = await _db.collection('games').get();
    return snapshot.docs
        .map((doc) => Game.fromJson(doc.data()).copyWith(id: doc.id))
        .toList();
  }

  Future<Game> fetchGameById(String id) async {
    final doc = await _db.collection('games').doc(id).get();

    if (!doc.exists) {
      throw Exception("Game not found");
    }

    return Game.fromJson(doc.data()!);
  }
}
