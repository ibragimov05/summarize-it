import 'package:summarize_it/data/services/dio/audio_dio_service.dart';

import '../models/dio_response.dart';

class AudioRepository {
  final AudioDioService _audioDioService;

  AudioRepository({required AudioDioService audioDioService})
      : _audioDioService = audioDioService;

  Future<DioResponse> getDownloadUrl(String text)  =>
      _audioDioService.getDownloadUrl(text);

  Future<DioResponse> downloadAudio({
    required String url,
    required String fileName,
  }) async =>
      await _audioDioService.downloadAudio(url, fileName);
}
