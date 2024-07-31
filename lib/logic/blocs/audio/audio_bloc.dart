import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:summarize_it/data/repositories/audio_repository.dart';

part 'audio_states.dart';
part 'audio_events.dart';

// audio_bloc.dart

class AudioBloc extends Bloc<AudioEvents, AudioStates> {
  final AudioRepository _audioRepository;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc({required AudioRepository audioRepository})
      : _audioRepository = audioRepository,
        super(InitialAudioState()) {
    on<GetAudioDownloadUrlEvent>(
      _getAudioDownloadUrl,
      transformer: (events, mapper) =>
          events.throttle(const Duration(microseconds: 500)).switchMap(mapper),
    );
    on<DownloadAudioEvent>(_downloadAudio);
    on<PlayAudioEvent>(_playAudio);
    on<PauseAudioEvent>(_pauseAudio);
    on<SkipForwardAudioEvent>(_skipForwardAudio);
    on<SkipBackwardAudioEvent>(_skipBackwardAudio);
  }

  void _getAudioDownloadUrl(
    GetAudioDownloadUrlEvent event,
    Emitter<AudioStates> emit,
  ) async {
    emit(LoadingAudioState());
    try {
      add(DownloadAudioEvent(
        fileName: event.bookTitle.replaceAll(' ', '-'),
        downloadUrl:
            'https://unreal-expire-in-90-days.s3-us-west-2.amazonaws.com/deeee2d6-1998-433c-8e41-67a620898a04-0.mp3',
      ));
      // final dioReponse = await _audioRepository.getDownloadUrl(event.summary);
      // if (dioReponse.isSuccess && dioReponse.errorMessage.isNotEmpty) {
      //   add(DownloadAudioEvent(
      //     fileName: event.bookTitle.replaceAll(' ', '-'),
      //     downloadUrl: dioReponse.data,
      //   ));
      // } else {
      //   throw 'dio error: ${dioReponse.errorMessage} ${dioReponse.statusCode}';
      // }
    } catch (e) {
      debugPrint('_getAudioDownloadUrl error: ${e.toString()}');
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }

  void _downloadAudio(
    DownloadAudioEvent event,
    Emitter<AudioStates> emit,
  ) async {
    try {
      final filePath = await _audioRepository.downloadAudio(
        url: event.downloadUrl,
        fileName: event.fileName,
      );
      emit(AudioDownloadedState(filePath: filePath.data));
    } catch (e) {
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }

  void _playAudio(
    PlayAudioEvent event,
    Emitter<AudioStates> emit,
  ) async {
    try {
      await _audioPlayer.setFilePath(event.filePath);
      _audioPlayer.play();
      emit(AudioPlayingState());
    } catch (e) {}
  }

  void _pauseAudio(
    PauseAudioEvent event,
    Emitter<AudioStates> emit,
  ) async {
    _audioPlayer.pause();
    emit(AudioPausedState());
  }

  void _skipForwardAudio(
    SkipForwardAudioEvent event,
    Emitter<AudioStates> emit,
  ) async {
    try {
      final currentPosition = _audioPlayer.position;
      final newPosition = currentPosition + const Duration(seconds: 5);
      _audioPlayer.seek(newPosition);
      emit(AudioPlayingState());
    } catch (e) {
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }

  void _skipBackwardAudio(
    SkipBackwardAudioEvent event,
    Emitter<AudioStates> emit,
  ) async {
    try {
      final currentPosition = _audioPlayer.position;
      final newPosition = currentPosition - const Duration(seconds: 5);
      _audioPlayer.seek(newPosition);
      emit(AudioPlayingState());
    } catch (e) {
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }
}
