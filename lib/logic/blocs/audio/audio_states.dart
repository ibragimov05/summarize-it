part of 'audio_bloc.dart';

sealed class AudioStates {}

final class InitialAudioState extends AudioStates {}

final class LoadingAudioState extends AudioStates {}

final class ErrorAudioState extends AudioStates {
  final String errorMessage;

  ErrorAudioState({required this.errorMessage});
}

final class AudioDownloadedState extends AudioStates {
  final String filePath;

  AudioDownloadedState({required this.filePath});
}

final class AudioPlayingState extends AudioStates {}

final class AudioPausedState extends AudioStates {}
