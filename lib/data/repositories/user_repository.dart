import '../models/app_response.dart';
import '../services/dio/user_dio_service.dart';

class UserRepository {
  final UserDioService _userDioService;

  UserRepository({required UserDioService userHttpService})
      : _userDioService = userHttpService;

  Future<AppResponse> getUser({required String uid}) async =>
      _userDioService.getUser(uid: uid);

  Future<AppResponse> addUser({
    required String uid,
    required String email,
    required String firstName,
    required String lastName,
  }) =>
      _userDioService.addUser(
        uid: uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

  Future<AppResponse> editUserInfo({
    required String userId,
    String? firstName,
    String? secondName,
  }) =>
      _userDioService.editUserInfo(
        userId: userId,
        firstName: firstName,
        secondName: secondName,
      );
}
