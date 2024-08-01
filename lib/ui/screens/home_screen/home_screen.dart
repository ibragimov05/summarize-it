import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/book_pages.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/custom_slider.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/greeting_message.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/helper_buttons.dart';
import 'package:summarize_it/core/utils/ai_constants.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_router.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

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

  String username = '';

  Future<void> getUserData() async {
    var hive = await Hive.openBox('user-info');
    // hive.put('');
    print(hive.get('user-info'));
  }

  @override
  void initState() {
    super.initState();
    getUserData().then(
      (value) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        title: SizedBox(
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: AppColors.green900),
              5.w(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: AppTextStyles.workSansMain.copyWith(fontSize: 17),
                  ),
                  Text(
                    'Good morning.',
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 13,
                      color: AppColors.greyscale400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          //! welcome and summarize screen
          BlocConsumer<GenerativeAiBloc, GenerativeAiStates>(
            listener: (context, state) {
              if (state is LoadedGenerativeAiState) {
                Navigator.pushNamed(context, AppRouter.summaryScreen);
              } else if (state is ErrorGenerativeAiState) {
                debugPrint(
                    '<-----> error GenerativeAiBloc: ${state.message} <----->');
                AppFunctions.showErrorSnackBar(
                  context,
                  'Something went wrong. Please, try again!',
                );
              }
            },
            builder: (context, state) {
              return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
                builder: (context, pdfState) {
                  if (pdfState is LoadingPdfToImageState ||
                      pdfState is LoadedPdfToImageState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ClearBookPages(),
                        if (state is LoadedGenerativeAiState)
                          IconButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              AppRouter.summaryScreen,
                            ),
                            icon: Icon(
                              AppFunctions.isAndroid()
                                  ? Icons.arrow_forward_rounded
                                  : Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                      ],
                    );
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
                        return Center(
                          child: Text(state.error),
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
                padding: const EdgeInsets.symmetric(vertical: 12),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is LoadedPdfToImageState)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              AppConstants.chooseSummaryLength,
                              style: AppTextStyles.workSansMain.copyWith(),
                            ),
                          ),
                          BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
                            builder: (context, state) {
                              return CustomSlider(
                                onSliderValChanged:
                                    state is LoadingGenerativeAiState
                                        ? null
                                        : (p0) => _summaryLength = p0,
                              );
                            },
                          ),
                        ],
                      ),
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
