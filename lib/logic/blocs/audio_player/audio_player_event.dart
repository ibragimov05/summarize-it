part of 'audio_player_bloc.dart';

sealed class AudioPlayerEvent {}

final class DownloadAudioEvent extends AudioPlayerEvent {
  final String summary;

  DownloadAudioEvent({required this.summary});
}

final class PlayAudioEvent extends AudioPlayerEvent {
  final String audioUrl;

  PlayAudioEvent({required this.audioUrl});
}

final class PauseAudioEvent extends AudioPlayerEvent {}

final class DisposeAudioEvent extends AudioPlayerEvent {}
