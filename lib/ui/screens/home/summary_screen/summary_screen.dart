import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/widgets/book_info_dialog.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/screens/home/summary_screen/widgets/summary_screen_floating_action_button.dart';

import '../../../../app_settings.dart';
import '../../../../core/utils/utils.dart' show AppColors;

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<AudioPlayerBloc>(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.summarizeItTransparent,
          shadowColor: AppColors.summarizeItWhite,
          leading: const ArrowBackButton(),
          title: Text(context.tr('summaryOfBook')),
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
                    tooltip: context.tr('infoAboutBook'),
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
              return Markdown(
                styleSheet: MarkdownStyleSheet(
                  a: AppTextStyles.workSansW500,
                  blockquote: AppTextStyles.workSansW800,
                ),
                data: state.book.summary,
                padding: const EdgeInsets.only(
                  bottom: kToolbarHeight + 20,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
              );
            }
            return Center(
              child: Text(context.tr('noResultsFound')),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const SummaryFloatButton(),
      ),
    );
  }
}
