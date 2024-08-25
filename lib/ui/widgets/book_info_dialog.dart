import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/utils/utils.dart';
import '../../data/models/book.dart';

class BookInfoDialog extends StatelessWidget {
  final Book book;

  const BookInfoDialog({super.key, required this.book});

  @override
  Widget build(BuildContext context) => AlertDialog(
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
              context.tr('authorName', namedArgs: {'name': book.author}),
              style: AppTextStyles.workSansMain.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Text(
              context.tr('publishedDate', namedArgs: {
                'date': '${DateFormat('dd').format(book.bookPublishedDate.toDate())} '
                    '${context.tr('months.${DateFormat('MM').format(book.bookPublishedDate.toDate())}')} '
                    '${DateFormat('y').format(book.bookPublishedDate.toDate())}'
              }),
              style: AppTextStyles.workSansMain.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            10.h(),
            Text(
              context.tr('bookFacts'),
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
              context.tr('awesome'),
              style: AppTextStyles.workSansMain.copyWith(
                color: AppColors.green900,
              ),
            ),
          ),
        ],
      );
}
