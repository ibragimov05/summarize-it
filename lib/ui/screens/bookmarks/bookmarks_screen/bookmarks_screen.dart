import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/search_books_text_field.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/show_summary_widget.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';

import '../../../../core/utils/device_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
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
                  return state.books.isNotEmpty
                      ? Column(
                          children: [
                            SearchBooksTextField(books: state.books),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 10,
                                ),
                                itemCount: state.books.length,
                                itemBuilder: (context, index) =>
                                    ShowSummaryWidget(book: state.books[index]),
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
          Lottie.asset(
            AppAssets.lottieDuck,
            height: DeviceScreen.w(context) / 2.5,
            width: DeviceScreen.w(context) / 2.5,
          ),
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
