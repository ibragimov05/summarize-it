import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/repositories/audio_repository.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerStates> {
  final AudioRepository audioRepository;
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayerBloc({
    required this.audioRepository,
  }) : super(InitialAudioPlayerState()) {
    on<DownloadAudioEvent>(_download);
    on<PlayAudioEvent>(_onPlayAudio);
    on<PauseAudioEvent>(_onPauseAudio);
    on<DisposeAudioEvent>(_onDisposeAudio);

    _audioPlayer.processingStateStream.listen(
      (processingState) {
        if (processingState == ProcessingState.completed) {
          add(PauseAudioEvent());
        }
      },
    );
  }

  void _download(DownloadAudioEvent event, emit) async {
    emit(LoadingAudioPlayerState());

    try {
      final audioUrl = await audioRepository.downloadAudio(event.summary);
      // emit(LoadedAudioPlayerState(
      //   'https://firebasestorage.googleapis.com/v0/b/summarize-it-8ae05.appspot.com/o/audios%2F%5B%232099e%5D.mp3?alt=media&token=eaefbdc7-a405-45b0-9ec9-8ec2617fb616',
      // ));
      emit(LoadedAudioPlayerState(audioUrl: audioUrl));
    } catch (e) {
      emit(ErrorAudioPlayerState(message: e.toString()));
    }
  }

  void _onPlayAudio(
    PlayAudioEvent event,
    Emitter<AudioPlayerStates> emit,
  ) async {
    if (_audioPlayer.processingState == ProcessingState.idle ||
        _audioPlayer.processingState == ProcessingState.completed) {
      await _audioPlayer.setUrl(event.audioUrl);
    }
    _audioPlayer.play();
    emit(PlayingAudioState(audioUrl: event.audioUrl));
  }

  void _onPauseAudio(
    PauseAudioEvent event,
    Emitter<AudioPlayerStates> emit,
  ) async {
    await _audioPlayer.pause();
    if (state is PlayingAudioState) {
      emit(PausedAudioState(audioUrl: (state as PlayingAudioState).audioUrl));
    }
  }

  void _onDisposeAudio(
    DisposeAudioEvent event,
    Emitter<AudioPlayerStates> emit,
  ) async {
    await _audioPlayer.dispose();
    emit(InitialAudioPlayerState());
  }
}
