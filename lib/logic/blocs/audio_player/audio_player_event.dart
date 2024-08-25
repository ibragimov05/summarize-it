part of 'audio_player_bloc.dart';

@freezed
class AudioPlayerEvent with _$AudioPlayerEvent {
  const factory AudioPlayerEvent.download({
    required String summary,
    required String summaryLanguage,
  }) = DownloadAudioEvent;

  const factory AudioPlayerEvent.play({
    required String audioUrl,
  }) = PlayAudioEvent;

  const factory AudioPlayerEvent.pause() = PauseAudioEvent;

  const factory AudioPlayerEvent.dispose() = DisposeAudioEvent;
}
