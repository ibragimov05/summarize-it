part of 'audio_player_bloc.dart';

sealed class AudioPlayerStates {}

final class InitialAudioPlayerState extends AudioPlayerStates {}

final class LoadingAudioPlayerState extends AudioPlayerStates {}

final class LoadedAudioPlayerState extends AudioPlayerStates {
  final String audioUrl;

  LoadedAudioPlayerState({required this.audioUrl});
}

final class PlayingAudioState extends AudioPlayerStates {
  final String audioUrl;

  PlayingAudioState({required this.audioUrl});
}

final class PausedAudioState extends AudioPlayerStates {
  final String audioUrl;

  PausedAudioState({required this.audioUrl});
}

final class ErrorAudioPlayerState extends AudioPlayerStates {
  final String message;

  ErrorAudioPlayerState({required this.message});
}
