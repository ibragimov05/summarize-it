import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:intl/intl.dart';

class BookInfoDialog extends StatelessWidget {
  final Book book;

  const BookInfoDialog({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text(
        book.title,
        style: AppTextStyles.workSansMain.copyWith(
          fontSize: 20,
          color: AppColors.green900,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Author name: ${book.author}',
            style: AppTextStyles.workSansMain.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            'Published date: ${DateFormat('dd-MMMM-y').format(book.bookPublishedDate.toDate())}',
            style: AppTextStyles.workSansMain.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          10.h(),
          Text(
            AppConstants.bookFacts,
            style: AppTextStyles.workSansMain.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          ...List.generate(
            book.facts.length,
            (index) => Text(
              '${index + 1}. ${book.facts[index]}',
              style: AppTextStyles.workSansMain.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(
              AppColors.green900.withOpacity(0.1),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppConstants.awesome,
            style: AppTextStyles.workSansMain.copyWith(
              color: AppColors.green900,
            ),
          ),
        ),
      ],
    );
  }
}
