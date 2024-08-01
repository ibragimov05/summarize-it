import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioCubit extends Cubit<bool> {
  final FlutterTts _flutterTts = FlutterTts();

  AudioCubit() : super(false) {
    _initializeTts();
  }

  Future<void> _initializeTts() async {
    try {
      List<dynamic> voices = await _flutterTts.getVoices;

      await _flutterTts.setSpeechRate(0.4);
      await _flutterTts.setVolume(0.5);
      await _flutterTts.setPitch(1.0);

      for (var voice in voices) {
        if (voice['name'] == 'Karen' && voice['locale'] == 'en-AU') {
          await _flutterTts.setVoice(voice);
          break;
        }
      }

      await _flutterTts.setQueueMode(1);

      if (await _flutterTts.isLanguageAvailable("en-AU")) {
        await _flutterTts.setLanguage("en-AU");
      }

      _flutterTts.setCompletionHandler(() {
        emit(false);
      });
    } catch (e) {
      // Handle error, possibly emit an error state
    }
  }

  void play(String text) async {
    await _flutterTts.speak(text);
    emit(true);
  }

  void pause() async {
    await _flutterTts.pause();
    emit(false);
  }

  void stop() async {
    await _flutterTts.stop();
    emit(false);
  }

  @override
  Future<void> close() {
    _flutterTts.stop();
    return super.close();
  }
}
