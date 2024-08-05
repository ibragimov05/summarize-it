import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final _dio = Dio();

  DioClient._private() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..responseType = ResponseType.json;
  }

  static final _singletonConstructor = DioClient._private();

  factory DioClient() => _singletonConstructor;

  Future<Response> getAudioDownloadUrl({required String summary}) async {
    try {
      final response = await _dio.post(
        'https://api.v7.unrealspeech.com/speech',
        data: {
          'Text': summary,
          'VoiceId': 'Dan',
          'Bitrate': '192k',
          'Speed': '0',
          'Pitch': '1',
          'TimestampType': 'sentence',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.get('UNREAL_SPEECH_KEY')}',
            'x-rapid-api-host': 'open-ai-text-to-speech1.p.rapidapi.com',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

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

  Future<Response> download({
    required String url,
    required String saveDirectory,
  }) async {
    final response = await _dio.download(
      url,
      saveDirectory,
    );

    return response;
  }

  Future<Response> updateData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
