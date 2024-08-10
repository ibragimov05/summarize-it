import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:intl/intl.dart';
import 'package:summarize_it/core/utils/utils.dart'
    show AppColors, AppRouter, SizedBoxExtension, AppFunctions, AppTextStyles;

import '../../../../../logic/blocs/books/books_bloc.dart';

class ShowSummaryWidget extends StatelessWidget {
  final Book book;
  final bool isDismissible;
  final VoidCallback? onDismissed;

  const ShowSummaryWidget({
    super.key,
    required this.book,
    this.onDismissed,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDismissible)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Dismissible(
              behavior: HitTestBehavior.translucent,
              direction: DismissDirection.endToStart,
              key: Key(book.id),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.error400,
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/icons/trash.svg'),
              ),
              onDismissed: (direction) {
                context.read<BooksBloc>().add(DeleteBookEvent(id: book.id));
                onDismissed!();
              },
              child: _summaryWidget(context),
            ),
          )
        else
          _summaryWidget(context),
        15.h(),
      ],
    );
  }

  Widget _summaryWidget(BuildContext context) => GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          AppRouter.bookmarkedSummaryScreen,
          arguments: book,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppFunctions.isLight(context)
                ? AppColors.green900.withOpacity(0.05)
                : AppColors.greyscale100.withOpacity(0.05),
            borderRadius: isDismissible ? null : BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: AppColors.green500,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      bottomRight: Radius.circular(isDismissible ? 0 : 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
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
                      'Summary added date: ${DateFormat('MMM d, HH:mm').format(book.summaryAddedDate.toDate())}',
                      style: AppTextStyles.workSansMain.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
