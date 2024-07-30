import '../models/user.dart';
import '../services/dio/user_dio_service.dart';

class UserRepository {
  final UserDioService _userDioService;

  UserRepository({required UserDioService userHttpService})
      : _userDioService = userHttpService;

  Future<UserModel> getUser({
    required String email,
    required String uid,
  }) async =>
      _userDioService.getUser(email: email, uid: uid);

  Future<UserModel> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String uid,
  }) =>
      _userDioService.addUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        uid: uid,
      );
}
