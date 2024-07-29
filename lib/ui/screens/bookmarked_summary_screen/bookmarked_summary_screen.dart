import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/book_info_dialog.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';

import '../../../core/utils/app_colors.dart';

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
      body: Markdown(
        data: widget.book.summary,
        padding: const EdgeInsets.only(
          bottom: kToolbarHeight + 15,
          left: 16,
          right: 16,
          top: 16,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RegularButton(
          w: double.infinity,
          onTap: () {},
          buttonLabel: 'Audio',
        ),
      ),
    );
  }
}
