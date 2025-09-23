import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class UserService {
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<List<User>> fetchUsers() async {
    final snapshot = await _usersCollection.get();
    return snapshot.docs
        .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<User?> fetchUserById(String id) async {
    final doc = await _usersCollection.doc(id).get();
    if (doc.exists) {
      return User.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    } else {
      return null;
    }
  }

  Future<User> createUser(User user) async {
    final docRef = await _usersCollection.add(user.toJson());
    final doc = await docRef.get();
    return User.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateUser(User user) async {
    if (user.id == null) {
      throw Exception('ID do usuário é obrigatório para atualização');
    }
    await _usersCollection.doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _usersCollection.doc(id).delete();
  }
}
