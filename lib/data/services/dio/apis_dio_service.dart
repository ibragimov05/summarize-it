import 'package:firebase_auth/firebase_auth.dart';
import 'package:summarize_it/core/network/dio_client.dart';

import '../../models/api.dart';

class ApisDioService {
  static final DioClient _dioClient = DioClient();

  static Future<Api?> get() async {
    final idToken = await _getIdToken();

    if (idToken == null) return null;

    try {
      final response = await _dioClient.get(
        url:
            'https://summarize-it-8ae05-default-rtdb.firebaseio.com/apis.json?auth=$idToken',
      );
      return Api.fromMap(response.data);
    } catch (_) {
      return null;
    }
  }

  static Future<String?> _getIdToken() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) return await user.getIdToken();

    return null;
  }
}
