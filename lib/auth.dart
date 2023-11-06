import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await currentUser?.updateDisplayName(displayName);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}