import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/found_books_widget.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';

import '../../../../logic/blocs/books/books_bloc.dart';
import '../../../widgets/animation_widget_with_bloc.dart';
import '../../../../core/utils/utils.dart'
    show AppTextStyles, AppColors, AppAssets;

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                context.tr('bookmarks'),
                style: AppTextStyles.workSansMain.copyWith(
                  fontSize: 22,
                  color: AppColors.green900,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BooksBloc, BooksState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const CustomCircularProgressIndicator(),
                    error: (message) => Center(child: Text(message)),
                    loaded: (books) => books.isNotEmpty
                        ? FoundBooksWidget(books: books)
                        : _noSavedBooks(context),
                    orElse: () => _noSavedBooks(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _noSavedBooks(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AnimationWidgetWithBloc(animationPath: AppAssets.lottieDuck),
          Center(
            child: Text(
              context.tr('noSavedBooks'),
              style: AppTextStyles.workSansW600.copyWith(
                fontSize: 18,
                color: AppColors.green900,
              ),
            ),
          ),
        ],
      );
}
