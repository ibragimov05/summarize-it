import 'package:summarize_it/core/network/dio_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:summarize_it/data/models/dio_response.dart';

class AudioDioService {
  final DioClient _dio = DioClient();

  Future<DioResponse> getDownloadUrl(String text) async {
    DioResponse dioResponse = DioResponse();

    try {
      final response = await _dio.getAudioDownloadUrl(text);

      if (response.statusCode == 200) {
        dioResponse.isSuccess = true;
        dioResponse.data = response.data['OutputUri'];
      } else {
        dioResponse.isSuccess = false;
        dioResponse.errorMessage = response.statusMessage ?? 'null';
        dioResponse.statusCode = response.statusCode;
      }
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<DioResponse> downloadAudio(String url, String fileName) async {
    DioResponse dioResponse = DioResponse();
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      final response = await _dio.download(
        url: url,
        saveDirectory: filePath,
      );

      if (response.statusCode == 200) {
        dioResponse.isSuccess = true;
        dioResponse.data = filePath;
      } else {
        dioResponse.errorMessage = response.statusMessage ?? 'null';
        dioResponse.statusCode = response.statusCode;
      }
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
