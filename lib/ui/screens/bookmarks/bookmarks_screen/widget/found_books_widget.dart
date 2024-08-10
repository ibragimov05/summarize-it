import 'package:easy_localization/easy_localization.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/core/utils/utils.dart' show AppTextStyles;

import 'search_books_text_field.dart';
import 'show_summary_widget.dart';

class FoundBooksWidget extends StatefulWidget {
  final List<Book> books;

  const FoundBooksWidget({super.key, required this.books});

  @override
  State<FoundBooksWidget> createState() => _FoundBooksWidgetState();
}

class _FoundBooksWidgetState extends State<FoundBooksWidget> {
  final ScrollController _scrollController = ScrollController();
  late List<Book> _booksList;

  @override
  void initState() {
    super.initState();
    _booksList = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBooksTextField(
          onChanged: (String value) {
            if (value.trim().isEmpty) {
              _booksList = widget.books;
            } else {
              _booksList = widget.books
                  .where(
                    (element) => element.title
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList();
            }
            setState(() {});
          },
        ),
        Expanded(
          child: _booksList.isNotEmpty
              ? FadingEdgeScrollView.fromScrollView(
                  gradientFractionOnStart: 0.3,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                    ),
                    itemCount: _booksList.length,
                    itemBuilder: (context, index) => ShowSummaryWidget(
                      book: _booksList[index],
                      onDismissed: () {
                        setState(() {
                          _booksList.removeAt(index);
                        });
                      },
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    context.tr('noBooksFoundMatchingQuery'),
                    style: AppTextStyles.workSansW600.copyWith(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ],
    );
  }
}
