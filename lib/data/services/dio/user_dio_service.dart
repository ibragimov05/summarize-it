import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:summarize_it/core/network/dio_client.dart';
import 'package:summarize_it/data/models/app_response.dart';
import 'package:summarize_it/data/models/user_model.dart';

class UserDioService {
  final String _firebaseCustomKey = dotenv.get('FIREBASE_CUSTOM_KEY');
  final String _baseUrl =
      'https://summarize-it-8ae05-default-rtdb.firebaseio.com';

  final DioClient _dio = DioClient();

  Future<UserModel> getUser({
    required String email,
    required String uid,
  }) async {
    try {
      final String idToken = await _getIdToken() ?? '';

      final String url =
          '$_baseUrl/$_firebaseCustomKey/users.json?auth=$idToken';

      final Response response = await _dio.get(url: url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> usersMap = response.data;

        UserModel? user;
        usersMap.forEach((key, value) {
          if (value['email'] == email && value['uid'] == uid) {
            value['id'] = key;
            user = UserModel.fromJson(value);
          }
        });

        if (user != null) {
          return user!;
        } else {
          throw Exception('Could not find user: ${response.data}');
        }
      } else {
        throw Exception('Failed to get users: ${response.data}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String uid,
  }) async {
    try {
      final String idToken = await _getIdToken() ?? '';

      final String url =
          '$_baseUrl/$_firebaseCustomKey/users.json?auth=$idToken';

      Map<String, dynamic> userData = {
        'uid': uid,
        'first-name': firstName,
        'last-name': lastName,
        'email': email,
      };

      final Response response = await _dio.post(
        url: url,
        data: userData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        userData['id'] = data['name'];
        return UserModel.fromJson(userData);
      } else {
        throw Exception(
            'Error adding user: status code ${response.statusCode}, body: ${response.data}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AppResponse> editUserInfo({
    required String userId,
    required String firstName,
    required String secondName,
  }) async {
    final AppResponse appResponse = AppResponse();

    try {
      final String idToken = await _getIdToken() ?? '';
      final String url =
          '$_baseUrl/$_firebaseCustomKey/users/$userId.json?auth=$idToken';

      appResponse.data = await _dio.updateData(url: url, data: {
        'first-name': firstName,
        'last-name': secondName,
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
    final f.User? user = f.FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await user.getIdToken();
    }
    throw Exception('No authenticated user found.');
  }
}
