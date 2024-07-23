import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/summary_screen/widgets/book_info_dialog.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/device_screen.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        shadowColor: AppColors.summarizeItWhite,
        leading: const ArrowBackButton(),
        title: const Text(AppConstants.summaryOfBook),
        actions: [
          BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
            builder: (context, state) {
              if (state is LoadedGenerativeAiState) {
                return IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => BookInfoDialog(book: state.book),
                    );
                  },
                  tooltip: AppConstants.infoAboutBook,
                  icon: const Icon(Icons.info_outline),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
      body: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
        builder: (context, state) {
          if (state is LoadedGenerativeAiState) {
            return Expanded(
              child: Markdown(
                data: state.book.summary,
                padding: const EdgeInsets.only(
                  bottom: kToolbarHeight + 15,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
              ),
            );
          }
          return const Center(
            child: Text(AppConstants.noResultsFound),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
        builder: (context, state) {
          if (state is LoadedGenerativeAiState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RegularButton(
                  w: DeviceScreen.w(context) / 2 - 50,
                  buttonLabel: AppConstants.audio,
                  onTap: () {},
                ),
                BlocConsumer<BooksBloc, BooksState>(
                  listener: (context, bookState) {
                    if (bookState is AddBookSuccessState) {
                      AppFunctions.showSnackBar(
                        context,
                        'New summary has been saved successfully!',
                      );
                    }
                  },
                  builder: (context, bookState) {
                    if (bookState is LoadingBookState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return RegularButton(
                      w: DeviceScreen.w(context) / 2 - 50,
                      buttonLabel: AppConstants.save,
                      onTap: () => context
                          .read<BooksBloc>()
                          .add(AddBookEvent(book: state.book)),
                    );
                  },
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
