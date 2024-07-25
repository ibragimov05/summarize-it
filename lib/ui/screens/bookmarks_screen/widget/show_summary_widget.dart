import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/extensions.dart';
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
        color: AppColors.green900.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(book.title, style: AppTextStyles.workSansMain),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                    height: 18,
                    width: 18,
                  ),
                  5.w(),
                  Text(
                    book.rateOfTheBook.toString(),
                    style: AppTextStyles.workSansMain
                        .copyWith(color: const Color(0xFFFFC34A)),
                  ),
                ],
              ),
            ],
          ),
          Text(
            book.categoryOfBook,
            style: AppTextStyles.workSansMain.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.greyscale900.withOpacity(0.5)),
          ),
          Text(
            book.author,
            style: AppTextStyles.workSansMain.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          Text(
            'Summary added date: ${DateFormat('MMM d, HH: mm').format(book.summaryAddedDate.toDate())}',
            style: AppTextStyles.workSansMain.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
