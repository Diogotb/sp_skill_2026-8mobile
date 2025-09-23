import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final _firebaseAuth = FirebaseAuth.instance;

  bool get isLogged => _firebaseAuth.currentUser != null;

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) async{
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}