import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../../app_settings.dart';
import 'widgets/book_pages.dart';
import 'widgets/clear_book_pages.dart';
import '../../../../core/utils/utils.dart';
import 'widgets/custom_slider.dart';
import 'widgets/helper_buttons.dart';
import 'widgets/home_screen_main_widget.dart';

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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt.get<GenerativeAiBloc>()),
          BlocProvider.value(value: getIt.get<FilePickerBloc>()),
          BlocProvider.value(value: getIt.get<PdfToImageBloc>()),
        ],
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: AppColors.summarizeItTransparent,
            title: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        buildWhen: (previous, current) =>
                            current.userStatus == UserStatus.loaded ||
                            current.userStatus == UserStatus.loading,
                        builder: (context, state) => state.userStatus ==
                                UserStatus.loading
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: DeviceScreen.w(context) / 3,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                context.tr('hi',
                                    namedArgs: {'name': UserData.firstName}),
                                style: AppTextStyles.workSansMain.copyWith(
                                  fontSize: 17,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                      Text(
                        context.tr(AppFunctions.getGreetingsText),
                        style: AppTextStyles.workSansMain.copyWith(
                          fontSize: 13,
                          color: AppColors.greyscale400,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  /// book images
                  BlocConsumer<FilePickerBloc, FilePickerStates>(
                    listener: (context, state) => state.whenOrNull(
                      loaded: (filePath, file) {
                        if (file != null) {
                          return context.read<PdfToImageBloc>().add(
                                PdfToImageEvents.convert(
                                  file: file,
                                  buttonController:
                                      RoundedLoadingButtonController(),
                                ),
                              );
                        }
                        return;
                      },
                    ),
                    builder: (context, state) => state.maybeWhen(
                      loaded: (filePath, file) => Expanded(
                        child: BlocBuilder<PdfToImageBloc, PdfToImageStates>(
                          builder: (context, state) => state.maybeWhen(
                              error: (error) => Center(child: Text(error)),
                              loading: (files) => BookPages(files: files),
                              loaded: (files) => BookPages(files: files),
                              orElse: () => const SizedBox()),
                        ),
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                ],
              ),

              /// welcome and summarize screen
              BlocConsumer<GenerativeAiBloc, GenerativeAiStates>(
                listener: (context, state) => state.whenOrNull(
                  loaded: (book) =>
                      Navigator.pushNamed(context, AppRouter.summaryScreen),
                  error: (message) => AppFunctions.showErrorSnackBar(
                    context,
                    context.tr('somethingWentWrong'),
                  ),
                ),
                builder: (context, state) {
                  return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
                    builder: (context, pdfState) => state.maybeWhen(
                      loading: () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ClearBookPages(),
                          if (state is LoadedGenerativeAiState)
                            IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRouter.summaryScreen),
                              icon: Icon(
                                AppFunctions.isAndroid()
                                    ? Icons.arrow_forward_rounded
                                    : Icons.arrow_forward_ios_rounded,
                              ),
                            ),
                        ],
                      ),
                      loaded: (book) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ClearBookPages(),
                          if (state is LoadedGenerativeAiState)
                            IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRouter.summaryScreen),
                              icon: Icon(
                                AppFunctions.isAndroid()
                                    ? Icons.arrow_forward_rounded
                                    : Icons.arrow_forward_ios_rounded,
                              ),
                            ),
                        ],
                      ),
                      orElse: () => const HomeScreenMainWidget(),
                    ),
                  );
                },
              ),
            ],
          ),
          //! open documents && submit book
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<PdfToImageBloc, PdfToImageStates>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state is LoadedPdfToImageState)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          context.tr('chooseSummaryLength'),
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
                  onOpenDocTap: () => context
                      .read<FilePickerBloc>()
                      .add(const FilePickerEvents.selectFile()),
                  onSubmitTap: state is LoadedPdfToImageState
                      ? () => context.read<GenerativeAiBloc>().add(
                            SummarizeAiEvent(
                              files: state.files,
                              summaryLength:
                                  SummaryLength.values[_summaryLength - 1],
                              buttonController: _submitButtonController,
                              summaryLanguage: AppFunctions.getLanguageEnum(
                                context.locale.languageCode,
                              ),
                            ),
                          )
                      : null,
                ),
              ],
            ),
          ),
        ),
      );
}
