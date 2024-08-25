import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../app_settings.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../widgets/regular_button.dart';
import '../../../../../logic/blocs/books/books_bloc.dart';
import '../../../../../logic/blocs/audio_player/audio_player_bloc.dart';
import '../../../../../logic/blocs/generative_ai/generative_ai_bloc.dart';

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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
          builder: (context, state) => state.maybeWhen(
            loaded: (book) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocConsumer<AudioPlayerBloc, AudioPlayerState>(
                  listener: (context, audioState) async {
                    audioState.whenOrNull(
                      loading: () => showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Lottie.asset(
                          'assets/lottie/ai.json',
                        ),
                      ),
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
                        Navigator.of(context).pop();
                        AppFunctions.showErrorSnackBar(
                          context,
                          context.tr('somethingWentWrong'),
                        );
                      },
                    );
                  },
                  builder: (context, audioState) => GestureDetector(
                    onTap: () {
                      if (!_isDownloaded) {
                        context
                            .read<AudioPlayerBloc>()
                            .add(AudioPlayerEvent.download(
                              summary: book.summary,
                              summaryLanguage: context.locale.languageCode,
                            ));
                        _isDownloaded = true;
                      }
                      audioState.whenOrNull(
                        loaded: (audioUrl) => context
                            .read<AudioPlayerBloc>()
                            .add(AudioPlayerEvent.play(audioUrl: audioUrl)),
                        playing: (audioUrl) => context
                            .read<AudioPlayerBloc>()
                            .add(const AudioPlayerEvent.pause()),
                        paused: (audioUrl) => context
                            .read<AudioPlayerBloc>()
                            .add(AudioPlayerEvent.play(audioUrl: audioUrl)),
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
                  ),
                ),

                /// save summary
                BlocListener<BooksBloc, BooksState>(
                  listener: (context, bookState) => bookState.whenOrNull(
                    addBookSuccess: (addedBookId) {
                      _bookId = addedBookId;
                      return AppFunctions.showSnackBar(
                        context,
                        'New summary has been saved successfully!',
                      );
                    },
                  ),
                  child: RegularButton(
                    w: DeviceScreen.w(context) / 1.6,
                    buttonLabel: context.tr('save'),
                    onTap: () {
                      book.audioUrl = _audioUrl ?? 'null';
                      context.read<BooksBloc>().add(BooksEvent.addBook(
                            book: book,
                            userID: FirebaseAuth.instance.currentUser!.uid,
                          ));
                      _isBookSaved = true;
                    },
                  ),
                ),
              ],
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      );

  @override
  void dispose() {
    getIt.get<AudioPlayerBloc>().add(const AudioPlayerEvent.dispose());
    super.dispose();
  }
}
