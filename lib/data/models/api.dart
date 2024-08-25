class Api {
  final String geminiKEY;
  final String unrealSpeechKEY;
  final String uzbekVoiceAiKEY;

  const Api({
    required this.geminiKEY,
    required this.unrealSpeechKEY,
    required this.uzbekVoiceAiKEY,
  });

  factory Api.fromMap(Map<String, dynamic> map) {
    return Api(
      geminiKEY: map['GEMINI_API_KEY'] as String,
      unrealSpeechKEY: map['UNREAL_SPEECH_KEY'] as String,
      uzbekVoiceAiKEY: map['UZBEK_VOICE_AI_KEY'] as String,
    );
  }

  @override
  String toString() {
    return 'Api{ GEMINI_API_KEY: $geminiKEY, UNREAL_SPEECH_KEY: $unrealSpeechKEY, UZBEK_VOICE_AI_KEY: $uzbekVoiceAiKEY}';
  }
}
