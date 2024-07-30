import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch(e) {
      throw(e.message.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<User> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user!;
    } on FirebaseAuthException catch(e){
      throw(e.message.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch(e){
      throw(e.message.toString());
    }  catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw(e.message.toString());
    }  catch (e) {
      rethrow;
    }
  }

  Stream<User?> watchAuth() => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;
}
