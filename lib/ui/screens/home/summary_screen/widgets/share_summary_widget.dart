import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/data/models/book.dart';

class ShareSummaryWidget extends StatelessWidget {
  final Book book;

  const ShareSummaryWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => AppFunctions.shareSummary(book),
      icon: SvgPicture.asset(
        AppAssets.share,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
