import 'package:summarize_it/data/services/http/user_http_service.dart';

import '../models/user.dart';

class UserRepository {
  final UserHttpService _userHttpService;

  UserRepository({required UserHttpService userHttpService})
      : _userHttpService = userHttpService;

  Future<UserModel> getUser({
    required String email,
    required String uid,
  }) async =>
      _userHttpService.getUser(email: email, uid: uid);

  Future<UserModel> addUser({
    required String firstName,
    required String lastName,
    required String email,
  }) =>
      _userHttpService.addUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
}
