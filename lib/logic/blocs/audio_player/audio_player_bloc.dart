import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repositories/audio_repository.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';
part 'audio_player_bloc.freezed.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioRepository audioRepository;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerBloc({
    required this.audioRepository,
  }) : super(const AudioPlayerState.initial()) {
    on<DownloadAudioEvent>(_onDownloadAudio);
    on<PlayAudioEvent>(_onPlayAudio);
    on<PauseAudioEvent>(_onPauseAudio);
    on<DisposeAudioEvent>(_onDisposeAudio);

    _audioPlayer.processingStateStream.listen(
      (processingState) {
        if (processingState == ProcessingState.completed) {
          add(const AudioPlayerEvent.pause());
        }
      },
    );
  }

  void _onDownloadAudio(
    DownloadAudioEvent event,
    Emitter<AudioPlayerState> emit,
  ) async {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else if (_audioPlayer.processingState == ProcessingState.idle) {
      emit(const AudioPlayerState.loading());

      try {
        final audioUrl = await audioRepository.downloadAudio(
          summary: event.summary,
          summaryLang: event.summaryLanguage,
        );

        emit(AudioPlayerState.loaded(audioUrl));
      } catch (e) {
        emit(AudioPlayerState.error(e.toString()));
      }
    }
  }

  void _onPlayAudio(
    PlayAudioEvent event,
    Emitter<AudioPlayerState> emit,
  ) async {
    if (_audioPlayer.processingState == ProcessingState.idle ||
        _audioPlayer.processingState == ProcessingState.completed) {
      await _audioPlayer.setUrl(event.audioUrl);
    }
    _audioPlayer.play();
    emit(AudioPlayerState.playing(event.audioUrl));
  }

  void _onPauseAudio(
    PauseAudioEvent event,
    Emitter<AudioPlayerState> emit,
  ) async {
    await _audioPlayer.pause();
    state.whenOrNull(
      playing: (audioUrl) => emit(AudioPlayerState.paused(audioUrl)),
    );
  }

  void _onDisposeAudio(
    DisposeAudioEvent event,
    Emitter<AudioPlayerState> emit,
  ) async {
    _audioPlayer.pause();
    await _audioPlayer.dispose();
    emit(const AudioPlayerState.initial());
  }

  @override
  Future<void> close() async {
    _audioPlayer.pause();
    await _audioPlayer.dispose();
    return super.close();
  }
}
