import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/models/user_profile.dart';
import 'package:todo_list/services/auth_service.dart';
import 'package:todo_list/services/firestore_service.dart';

class UserProvider extends ChangeNotifier{
  final _auth = AuthService();
  final _store = FirestoreService();

  User? _currentUser;
  User? get currentUser => _currentUser;

  Future<void> register(String email, String password) async{
    final userCredential = await _auth.registerWithEmailAndPassword(email, password);
    final userTemplate = UserProfile(uid: userCredential.user!.uid);
    await _store.addDocument('users',
      userTemplate.toMap()
    );
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async{
    final credential = await _auth.signIn(email, password);
    _currentUser = credential.user;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _currentUser = null;
    notifyListeners();
  }
}