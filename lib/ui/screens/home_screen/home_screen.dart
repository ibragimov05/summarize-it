import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/book_pages.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/custom_slider.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/greeting_message.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/helper_buttons.dart';
import 'package:summarize_it/utils/ai_constants.dart';
import 'package:summarize_it/utils/app_functions.dart';
import 'package:summarize_it/utils/app_router.dart';

import 'widgets/clear_book_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _summaryLength = 1;

  final RoundedLoadingButtonController _submitButtonController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _openDocButtonController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //! welcome and summarize screen
          BlocConsumer<GenerativeAiBloc, GenerativeAiStates>(
            listener: (context, state) {
              if (state is LoadedGenerativeAiState) {
                Navigator.pushNamed(context, AppRouter.summaryScreen);
              } else if (state is ErrorGenerativeAiState) {
                AppFunctions.showErrorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
                builder: (context, pdfState) {
                  if (pdfState is LoadingPdfToImageState ||
                      pdfState is LoadedPdfToImageState) {
                    return const ClearBookPages();
                  }
                  return const Expanded(child: GreetingMessage());
                },
              );
            },
          ),

          //! book images
          BlocConsumer<FilePickerBloc, FilePickerStates>(
            listener: (context, state) {
              if (state is LoadedFilePickerState) {
                if (state.file != null) {
                  context.read<PdfToImageBloc>().add(
                        ConvertPdfToImageEvent(
                          file: state.file!,
                          buttonController: RoundedLoadingButtonController(),
                        ),
                      );
                }
              }
            },
            builder: (context, state) {
              if (state is LoadedFilePickerState) {
                return Expanded(
                  child: BlocBuilder<PdfToImageBloc, PdfToImageStates>(
                    builder: (context, state) {
                      if (state is ErrorPdfToImageState) {
                        return const Center(
                          child: Text("Fayl yuklanishda xatolik"),
                        );
                      }

                      if (state is LoadingPdfToImageState ||
                          state is LoadedPdfToImageState) {
                        final files = state is LoadedPdfToImageState
                            ? state.files
                            : (state as LoadingPdfToImageState).files;

                        return BookPages(files: files);
                      }

                      return const SizedBox();
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),

          //! open documents && submit book
          BlocBuilder<PdfToImageBloc, PdfToImageStates>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 25,
                    offset: Offset(0, -10),
                  ),
                ]),
                child: Column(
                  children: [
                    CustomSlider(
                        onSliderValChanged: (p0) => _summaryLength = p0),
                    HelperButtons(
                      openDocButtonController: _openDocButtonController,
                      submitButtonController: _submitButtonController,
                      onOpenDocTap: () {
                        context.read<FilePickerBloc>().add(SelectFileEvent());
                      },
                      onSubmitTap: state is LoadedPdfToImageState
                          ? () {
                              context.read<GenerativeAiBloc>().add(
                                    SummarizeAiEvent(
                                      files: state.files,
                                      summaryLength: SummaryLength
                                          .values[_summaryLength - 1],
                                      buttonController: _submitButtonController,
                                    ),
                                  );
                            }
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
