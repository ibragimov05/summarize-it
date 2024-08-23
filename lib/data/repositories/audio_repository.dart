import '../services/dio/audio_dio_service.dart';

class AudioRepository {
  final AudioService _audioService;

  AudioRepository({required AudioService audioService})
      : _audioService = audioService;

  Future<String> downloadAudio({
    required String summary,
    required String summaryLang,
  }) async =>
      await _audioService.downloadAudio(
        summary: summary,
        summaryLang: summaryLang,
      );
}
