import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final _dio = Dio();
  // final String _firebaseCustomKey = dotenv.get('FIREBASE_CUSTOM_KEY');

  DioClient._private() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..responseType = ResponseType.json;
  }

  static final _singletonConstructor = DioClient._private();

  factory DioClient() => _singletonConstructor;

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
