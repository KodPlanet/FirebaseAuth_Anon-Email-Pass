import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInAnonymously() async {
    final userCredentials = await _firebaseAuth.signInAnonymously();
    return userCredentials.user;
  }

  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredentials.user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredentials.user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User> authStatus() {
    return _firebaseAuth.authStateChanges();
  }
}
