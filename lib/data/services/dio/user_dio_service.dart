import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:summarize_it/core/network/dio_client.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/data/models/app_response.dart';
import 'package:summarize_it/data/models/user_model.dart';

class UserDioService {
  final String _baseUrl =
      'https://summarize-it-8ae05-default-rtdb.firebaseio.com';

  final DioClient _dio = DioClient();

  Future<AppResponse> getUser({required String uid}) async {
    final AppResponse appResponse = AppResponse();

    try {
      final String idToken = await _getIdToken() ?? '';

      final Response response = await _dio.get(
        url: '$_baseUrl/users.json?auth=$idToken',
      );

      final Map<String, dynamic> usersMap = response.data;

      UserModel? user;

      usersMap.forEach((key, value) {
        if (value['uid'] == uid) {
          value['id'] = key;
          user = UserModel.fromJson(value);
        }
      });

      if (user != null) {
        appResponse.data = user!;
      } else {
        throw 'could not find user';
      }
    } catch (e) {
      appResponse.isSuccess = false;
      if (e is DioException) {
        appResponse.errorMessage = e.response?.data ?? 'error';
        appResponse.errorStatusCode = e.response?.statusCode;
      } else {
        appResponse.errorMessage = e.toString();
      }
    }

    return appResponse;
  }

  Future<AppResponse> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String uid,
  }) async {
    final AppResponse appResponse = AppResponse();

    try {
      final String idToken = await _getIdToken() ?? '';

      final String url = '$_baseUrl/users.json?auth=$idToken';

      Map<String, dynamic> userData = {
        'uid': uid,
        'first-name': firstName,
        'last-name': lastName,
        'email': email,
        'user-chat-color': AppFunctions.getRandomColorForUserProfile,
      };

      final Response response = await _dio.post(
        url: url,
        data: userData,
      );

      final Map<String, dynamic> data = response.data;

      userData['id'] = data['name'];

      appResponse.data = UserModel.fromJson(userData);
    } catch (e) {
      if (e is DioException) {
        appResponse.errorMessage = "${e.response?.data["message"]}";
        appResponse.errorStatusCode = e.response?.statusCode;
      } else {
        appResponse.errorMessage = e.toString();
      }
    }

    return appResponse;
  }

  Future<AppResponse> editUserInfo({
    required String userId,
    String? firstName,
    String? secondName,
  }) async {
    final AppResponse appResponse = AppResponse();
    try {
      final String idToken = await _getIdToken() ?? '';
      final String url = '$_baseUrl/users/$userId.json?auth=$idToken';

      appResponse.data = await _dio.updateData(url: url, data: {
        if (firstName != null) 'first-name': firstName,
        if (secondName != null) 'last-name': secondName,
      });

      appResponse.isSuccess = true;
    } catch (e) {
      if (e is DioException) {
        appResponse.errorMessage = "${e.response?.data["message"]}";
        appResponse.errorStatusCode = e.response?.statusCode;
      } else {
        appResponse.errorMessage = e.toString();
      }
    }
    return appResponse;
  }

  Future<String?> _getIdToken() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) return await user.getIdToken();

    return null;
  }
}
