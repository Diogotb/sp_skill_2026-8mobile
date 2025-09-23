import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserGameService {
  final _db = FirebaseFirestore.instance;

  Future<void> toggleFavorite(String gameId) async {
    final user = FirebaseAuth.instance.currentUser!;
    final docRef = _db.collection('users').doc(user.uid).collection('favorites').doc(gameId);
    final exists = (await docRef.get()).exists;

    if (exists) {
      await docRef.delete();
    } else {
      await docRef.set({'addedAt': DateTime.now()});
    }
  }

  Future<void> toggleCollection(String gameId) async {
    final user = FirebaseAuth.instance.currentUser!;
    final docRef = _db.collection('users').doc(user.uid).collection('collection').doc(gameId);
    final exists = (await docRef.get()).exists;

    if (exists) {
      await docRef.delete();
    } else {
      await docRef.set({'addedAt': DateTime.now()});
    }
  }

  Future<Set<String>> fetchFavoriteIds() async {
    final user = FirebaseAuth.instance.currentUser!;
    final snapshot = await _db.collection('users').doc(user.uid).collection('favorites').get();
    return snapshot.docs.map((d) => d.id).toSet();
  }

  Future<Set<String>> fetchCollectionIds() async {
    final user = FirebaseAuth.instance.currentUser!;
    final snapshot = await _db.collection('users').doc(user.uid).collection('collection').get();
    return snapshot.docs.map((d) => d.id).toSet();
  }
}
