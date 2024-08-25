import 'package:firebase_auth/firebase_auth.dart';
import 'package:summarize_it/data/services/firebase/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository({required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  Future<void> login({
    required String email,
    required String password,
  }) async =>
      await _firebaseAuthService.loginUser(email: email, password: password);

  Future<User> register({
    required String email,
    required String password,
  }) async =>
      _firebaseAuthService.registerUser(email: email, password: password);

  Future<void> logout() async => _firebaseAuthService.logoutUser();

  Future<void> resetPassword({required String email}) async =>
      _firebaseAuthService.resetPassword(email: email);

  Stream<User?> watchAuth() => _firebaseAuthService.watchAuth();
}
