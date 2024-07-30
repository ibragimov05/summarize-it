part of 'audio_bloc.dart';

@immutable
sealed class AudioEvents {}

final class GetAudioDownloadUrlEvent extends AudioEvents {
  final String text;

  GetAudioDownloadUrlEvent({required this.text});
}

final class DownloadAudioUrlEvent extends AudioEvents {
  final String text;

  DownloadAudioUrlEvent({required this.text});
}
