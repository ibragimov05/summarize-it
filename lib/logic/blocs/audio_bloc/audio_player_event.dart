part of 'audio_bloc.dart';

@immutable
sealed class AudioEvent {}

final class DownloadAudioEvent extends AudioEvent {
  final String summary;

  DownloadAudioEvent({required this.summary});
}