import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
