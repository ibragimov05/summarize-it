part of 'audio_bloc.dart';

@immutable
sealed class AudioStates {}

final class InitialAudioState extends AudioStates {}

final class LoadingAudioState extends AudioStates {}

final class LoadedAudioState extends AudioStates {}

final class ErrorAudioState extends AudioStates {
  final String errorMessage;

  ErrorAudioState({required this.errorMessage});
}
