part of 'audio_bloc.dart';

@immutable
sealed class AudioState {}

final class AudioInitial extends AudioState {}

final class InitialAudioPlayerState extends AudioState {}

final class LoadingAudioPlayerState extends AudioState {}

final class LoadedAudioPlayerState extends AudioState {
  final String audioUrl;

  LoadedAudioPlayerState({required this.audioUrl});
}

final class ErrorAudioPlayerState extends AudioState {
  final String errorMessage;

  ErrorAudioPlayerState({required this.errorMessage});
}
