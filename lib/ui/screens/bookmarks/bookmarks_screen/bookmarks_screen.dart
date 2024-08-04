import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/search_books_text_field.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/show_summary_widget.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';

import '../../../widgets/animation_widget_with_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Text(
              AppConstants.bookmarks,
              style: AppTextStyles.workSansMain.copyWith(
                fontSize: 22,
                color: AppColors.green900,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is LoadingBookState) {
                  return const CustomCircularProgressIndicator();
                } else if (state is ErrorBookState) {
                  return Center(child: Text(state.message));
                }
                if (state is LoadedBookState) {
                  final List<Book> books = state.books;
                  return books.isNotEmpty
                      ? Column(
                          children: [
                            SearchBooksTextField(books: books),
                            Expanded(
                              child: FadingEdgeScrollView.fromScrollView(
                                gradientFractionOnStart: 0.3,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 10,
                                  ),
                                  itemCount: books.length,
                                  itemBuilder: (context, index) =>
                                      ShowSummaryWidget(book: books[index]),
                                ),
                              ),
                            )
                          ],
                        )
                      : _noSavedBooks();
                }
                return _noSavedBooks();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _noSavedBooks() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AnimationWidgetWithBloc(animationPath: AppAssets.lottieDuck),
          Center(
            child: Text(
              AppConstants.noSavedBooks,
              style: AppTextStyles.workSansW600.copyWith(
                fontSize: 18,
                color: AppColors.green900,
              ),
            ),
          ),
        ],
      );
}
