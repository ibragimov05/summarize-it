import '../../data/services/dio/apis_dio_service.dart';

class Apis {
  static String geminiApiKEY = '';
  static String unrealSpeechKEY = '';
  static String uzbekVoiceAiKEY = '';

  static Future<void> set() async {
    final api = await ApisDioService.get();

    if (api == null) return;

    geminiApiKEY = api.geminiKEY;
    unrealSpeechKEY = api.unrealSpeechKEY;
    uzbekVoiceAiKEY = api.uzbekVoiceAiKEY;
  }
}
