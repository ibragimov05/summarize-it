import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../widgets/widgets.dart';
import '../../../../app_settings.dart';
import 'widgets/share_summary_widget.dart';
import '../../../../core/utils/utils.dart';
import 'widgets/summary_screen_floating_action_button.dart';
import '../../../../logic/blocs/audio_player/audio_player_bloc.dart';
import '../../../../logic/blocs/generative_ai/generative_ai_bloc.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
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
                    return ShareSummaryWidget(book: state.book);
                  }
                  return const SizedBox();
                },
              ),
              BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
                builder: (context, state) => state.maybeWhen(
                  loaded: (book) => IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => BookInfoDialog(book: book),
                      );
                    },
                    tooltip: context.tr('infoAboutBook'),
                    icon: const Icon(Icons.info_outline),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              )
            ],
          ),
          body: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
            builder: (context, state) => state.maybeWhen(
              loaded: (book) => ListView(
                padding: const EdgeInsets.only(
                  bottom: kToolbarHeight + 20,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                children: [
                  MarkdownBody(
                    styleSheet: MarkdownStyleSheet(
                      a: AppTextStyles.workSansW500,
                      blockquote: AppTextStyles.workSansW800,
                    ),
                    data: book.summary,
                    selectable: true,
                  ),
                ],
              ),
              orElse: () => Center(
                child: Text(context.tr('noResultsFound')),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const SummaryFloatButton(),
        ),
      );
}
