import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/bookmarks_screen/widget/show_summary_widget.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';

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
              bloc: context.read<BooksBloc>()..add(GetBookEvent()),
              builder: (context, state) {
                if (state is LoadingBookState) {
                  return const CustomCircularProgressIndicator();
                } else if (state is ErrorBookState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is LoadedBookState) {
                  return state.books.isEmpty
                      ? _noSavedBooks()
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 10,
                          ),
                          itemCount: state.books.length,
                          itemBuilder: (context, index) =>
                              ShowSummaryWidget(book: state.books[index]),
                        );
                }
                return _noSavedBooks();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _noSavedBooks() => const Center(
        child: Text(AppConstants.noSavedBooks),
      );
}