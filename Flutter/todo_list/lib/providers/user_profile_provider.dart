import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/models/user_profile.dart';
import 'package:todo_list/providers/user_provider.dart';
import 'package:todo_list/services/firestore_service.dart';

class UserProfileProvider extends ChangeNotifier {
  final _firestoreService = FirestoreService();
  final _userProvider = UserProvider();
  late UserProfile _currentUserProfile;

  Future<void> loadCurrentProfile() async {
    final docRef = _firestoreService.getDocumentReference("users/${_userProvider.currentUser!.uid}");
    final snapshot = await docRef.get();

    if (snapshot.exists){
      _currentUserProfile = UserProfile.fromMap(snapshot.data() as Map<String, dynamic>);
    } else{
      throw Exception("Perfil não encontrado");
    }
  }

  UserProfile get currentUserProfile => _currentUserProfile;
}
