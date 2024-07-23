import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/data/models/book.dart';

class ShowSummaryWidget extends StatelessWidget {
  final Book book;

  const ShowSummaryWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.green900.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book name: ${book.title}',
                style: AppTextStyles.workSansMain.copyWith(fontWeight: FontWeight.w500,),
              ),
              Text(
                'Author: ${book.author}',
                style: AppTextStyles.workSansMain.copyWith(fontWeight: FontWeight.w500,),
              ),
              Text(
                'Summary added date: ${DateFormat('MMM d, HH:mm').format(book.summaryAddedDate.toDate())}',
                style: AppTextStyles.workSansMain.copyWith(fontWeight: FontWeight.w500,),
              ),
              Text(book.bookPublishedDate.toDate().toString()),
            ],
          ),
        ],
      ),
    );
  }
}
