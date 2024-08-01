import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/audio_play_pause_widget.dart';
import 'package:summarize_it/ui/widgets/book_info_dialog.dart';

import '../../../../core/utils/app_colors.dart';

class BookmarkedSummaryScreen extends StatelessWidget {
  final Book book;

  const BookmarkedSummaryScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        shadowColor: AppColors.summarizeItWhite,
        title: Text(book.title),
        leading: const ArrowBackButton(),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => BookInfoDialog(book: book),
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Markdown(
              data: book.summary,
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
      floatingActionButton: AudioPlayPauseWidget(summary: book.summary),
    );
  }
}
