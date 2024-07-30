import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/data/repositories/audio_repository.dart';
import 'package:summarize_it/data/services/dio/audio_dio_service.dart';

part 'audio_states.dart';
part 'audio_events.dart';

class AudioBloc extends Bloc<AudioEvents, AudioStates> {
  final AudioRepository _audioRepository;
  AudioBloc({required AudioRepository audioRepository})
      : _audioRepository = audioRepository,
        super(InitialAudioState()) {
    on<GetAudioDownloadUrlEvent>(_getAudioDownloadUrl);
  }
  void _getAudioDownloadUrl(
    GetAudioDownloadUrlEvent event,
    Emitter<AudioStates> emit,
  ) async {
    emit(LoadingAudioState());
    print(':LOADING');
    try {
      final dioReponse = await _audioRepository.getDownloadUrl(event.text);
      print(dioReponse.data);
    } catch (e) {
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }
}
