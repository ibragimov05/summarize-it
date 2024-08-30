import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

import 'show_summary_widget.dart';
import 'search_books_text_field.dart';
import '../../../../../data/models/book.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FoundBooksWidget extends StatefulWidget {
  final List<Book> books;

  const FoundBooksWidget({super.key, required this.books});

  @override
  State<FoundBooksWidget> createState() => _FoundBooksWidgetState();
}

class _FoundBooksWidgetState extends State<FoundBooksWidget> {
  final ScrollController _scrollController = ScrollController();
  late List<Book> _booksList;
  late List<Book> _filteredBooksList;

  @override
  void initState() {
    super.initState();
    _booksList = List.from(widget.books);
    _filteredBooksList = _booksList;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SearchBooksTextField(
            onChanged: (String value) => setState(
              () => value.trim().isEmpty
                  ? _filteredBooksList = _booksList
                  : _filteredBooksList = _booksList
                      .where(
                        (element) => element.title
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                      .toList(),
            ),
          ),
          Expanded(
            child: _filteredBooksList.isNotEmpty
                ? FadingEdgeScrollView.fromScrollView(
                    gradientFractionOnStart: 0.3,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 10,
                      ),
                      itemCount: _filteredBooksList.length,
                      itemBuilder: (context, index) => ShowSummaryWidget(
                        book: _filteredBooksList[index],
                        onDismissed: () => setState(() {
                          final removedBook =
                              _filteredBooksList.removeAt(index);
                          _booksList.remove(removedBook);
                        }),
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
