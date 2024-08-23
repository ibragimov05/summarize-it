import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarked_summary_screen/play_pause_audio_widget.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/book_info_dialog.dart';

import '../../../../core/utils/app_colors.dart';

class BookmarkedSummaryScreen extends StatefulWidget {
  final Book book;

  const BookmarkedSummaryScreen({super.key, required this.book});

  @override
  State<BookmarkedSummaryScreen> createState() =>
      _BookmarkedSummaryScreenState();
}

class _BookmarkedSummaryScreenState extends State<BookmarkedSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        shadowColor: AppColors.summarizeItWhite,
        title: Text(widget.book.title),
        leading: const ArrowBackButton(),
        actions: [
          Text(widget.book.summaryLanguage == 'en' ? '🇺🇸' : '🇺🇿'),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  BookInfoDialog(book: widget.book),
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Markdown(
              data: widget.book.summary,
              padding: const EdgeInsets.only(
                bottom: kToolbarHeight + 15,
                left: 16,
                right: 16,
                top: 16,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: widget.book.audioUrl != 'null'
          ? PlayPauseAudioWidget(
              summaryAudioUrl: widget.book.audioUrl,
            )
          : null,
    );
  }
}
