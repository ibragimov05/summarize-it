part of 'audio_bloc.dart';

@immutable
sealed class AudioEvents {}

final class GetAudioDownloadUrlEvent extends AudioEvents {
  final String bookTitle;
  final String summary;

  GetAudioDownloadUrlEvent({required this.bookTitle, required this.summary});
}

final class DownloadAudioEvent extends AudioEvents {
  final String fileName;
  final String downloadUrl;

  DownloadAudioEvent({required this.fileName, required this.downloadUrl});
}

final class PlayAudioEvent extends AudioEvents {
  final String filePath;

  PlayAudioEvent({required this.filePath});
}

final class PauseAudioEvent extends AudioEvents {}

final class SkipForwardAudioEvent extends AudioEvents {}

final class SkipBackwardAudioEvent extends AudioEvents {}
