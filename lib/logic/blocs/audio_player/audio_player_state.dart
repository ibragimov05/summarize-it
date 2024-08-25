part of'audio_player_bloc.dart';

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState.initial() = InitialAudioPlayerState;
  const factory AudioPlayerState.loading() = LoadingAudioPlayerState;
  const factory AudioPlayerState.loaded(String audioUrl) = LoadedAudioPlayerState;
  const factory AudioPlayerState.playing(String audioUrl) = PlayingAudioState;
  const factory AudioPlayerState.paused(String audioUrl) = PausedAudioState;
  const factory AudioPlayerState.error(String message) = ErrorAudioPlayerState;
}
