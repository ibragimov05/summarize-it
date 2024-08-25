import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:summarize_it/app_settings.dart';

import '../../../../../logic/blocs/books/books_bloc.dart';
import '../../../../../logic/blocs/audio_player/audio_player_bloc.dart';
import '../../../../../logic/blocs/generative_ai/generative_ai_bloc.dart';
import '../../../../widgets/regular_button.dart';

import '../../../../../core/utils/utils.dart'
    show AppFunctions, DeviceScreen, AppColors;

class SummaryFloatButton extends StatefulWidget {
  const SummaryFloatButton({super.key});

  @override
  State<SummaryFloatButton> createState() => _SummaryFloatButtonState();
}

class _SummaryFloatButtonState extends State<SummaryFloatButton> {
  bool _isDownloaded = false;
  String? _audioUrl;
  bool _isBookSaved = false;
  String? _bookId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
        builder: (context, state) {
          if (state is LoadedGenerativeAiState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocConsumer<AudioPlayerBloc, AudioPlayerState>(
                  listener: (context, audioState) async {
                    audioState.whenOrNull(
                      loading: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Lottie.asset(
                            'assets/lottie/ai.json',
                          ),
                        );
                      },
                      loaded: (audioUrl) {
                        _audioUrl = audioUrl;
                        context
                            .read<AudioPlayerBloc>()
                            .add(AudioPlayerEvent.play(audioUrl: _audioUrl!));
                        Navigator.of(context).pop();
                        if (_isBookSaved) {
                          context.read<BooksBloc>().add(
                                BooksEvent.addAudioUrl(
                                  bookId: _bookId!,
                                  audioUrl: _audioUrl ?? 'null',
                                ),
                              );
                        }
                      },
                      error: (message) {
                        debugPrint(message);
                        Navigator.of(context).pop();
                        AppFunctions.showErrorSnackBar(
                          context,
                          context.tr('somethingWentWrong'),
                        );
                      },
                    );
                  },
                  builder: (context, audioState) {
                    return GestureDetector(
                      onTap: () {
                        if (!_isDownloaded) {
                          context
                              .read<AudioPlayerBloc>()
                              .add(AudioPlayerEvent.download(
                                summary: state.book.summary,
                                summaryLanguage: context.locale.languageCode,
                              ));
                          _isDownloaded = true;
                        }
                        audioState.whenOrNull(
                          loaded: (audioUrl) {
                            context
                                .read<AudioPlayerBloc>()
                                .add(AudioPlayerEvent.play(audioUrl: audioUrl));
                          },
                          playing: (audioUrl) {
                            context
                                .read<AudioPlayerBloc>()
                                .add(const AudioPlayerEvent.pause());
                          },
                          paused: (audioUrl) {
                            context
                                .read<AudioPlayerBloc>()
                                .add(AudioPlayerEvent.play(audioUrl: audioUrl));
                          },
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: const BoxDecoration(
                          color: AppColors.green900,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          audioState is PlayingAudioState
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),

                /// save summary
                BlocListener<BooksBloc, BooksState>(
                  listener: (context, bookState) {
                    bookState.whenOrNull(
                      addBookSuccess: (addedBookId) {
                        AppFunctions.showSnackBar(
                        context,
                        'New summary has been saved successfully!',
                      );
                        _bookId = addedBookId;
                      },
                    );
                  },
                  child: RegularButton(
                    w: DeviceScreen.w(context) / 1.6,
                    buttonLabel: context.tr('save'),
                    onTap: () {
                      state.book.audioUrl = _audioUrl ?? 'null';
                      context.read<BooksBloc>().add(BooksEvent.addBook(
                            book: state.book,
                            userID: FirebaseAuth.instance.currentUser!.uid,
                          ));
                      _isBookSaved = true;
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    getIt.get<AudioPlayerBloc>().add(const AudioPlayerEvent.dispose());
    super.dispose();
  }
}
