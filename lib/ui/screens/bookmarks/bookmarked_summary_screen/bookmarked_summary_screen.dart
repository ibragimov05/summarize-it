// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:summarize_it/core/utils/utils.dart';
// import 'package:summarize_it/data/models/book.dart';
// import 'package:summarize_it/ui/screens/bookmarks/bookmarked_summary_screen/widgets/play_pause_audio_widget.dart';
// import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
// import 'package:summarize_it/ui/widgets/book_info_dialog.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
//
// class BookmarkedSummaryScreen extends StatefulWidget {
//   final Book book;
//
//   const BookmarkedSummaryScreen({super.key, required this.book});
//
//   @override
//   State<BookmarkedSummaryScreen> createState() =>
//       _BookmarkedSummaryScreenState();
// }
//
// class _BookmarkedSummaryScreenState extends State<BookmarkedSummaryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: AppColors.summarizeItTransparent,
//         shadowColor: AppColors.summarizeItWhite,
//         title: Text(widget.book.title),
//         leading: const ArrowBackButton(),
//         actions: [
//           Text(widget.book.summaryLanguage == 'en' ? '🇺🇸' : '🇺🇿'),
//           IconButton(
//             onPressed: () => showDialog(
//               context: context,
//               builder: (BuildContext context) =>
//                   BookInfoDialog(book: widget.book),
//             ),
//             icon: const Icon(Icons.info_outline),
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(
//           bottom: kToolbarHeight * 2 + 15,
//           left: 16,
//           right: 16,
//           top: 16,
//         ),
//         children: [
//           MarkdownBody(
//             data: widget.book.summary,
//             selectable: true,
//             styleSheet: MarkdownStyleSheet(
//               p: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             shape: const CircleBorder(),
//             backgroundColor: AppColors.green900,
//             onPressed: () => AppFunctions.shareSummary(widget.book),
//             child: SvgPicture.asset(
//               AppAssets.share,
//               colorFilter: const ColorFilter.mode(
//                 AppColors.summarizeItWhite,
//                 BlendMode.srcIn,
//               ),
//             ),
//           ),
//           if (widget.book.audioUrl != 'null') 5.h(),
//           if (widget.book.audioUrl != 'null')
//             PlayPauseAudioWidget(summaryAudioUrl: widget.book.audioUrl),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarked_summary_screen/widgets/play_pause_audio_widget.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/book_info_dialog.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BookmarkedSummaryScreen extends StatefulWidget {
  final Book book;

  const BookmarkedSummaryScreen({super.key, required this.book});

  @override
  State<BookmarkedSummaryScreen> createState() =>
      _BookmarkedSummaryScreenState();
}

class _BookmarkedSummaryScreenState extends State<BookmarkedSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        shadowColor: AppFunctions.isLight(context)  ?AppColors.summarizeItWhite: null,
        title: Text(widget.book.title),
        leading: const ArrowBackButton(),
        actions: [
          Text(widget.book.summaryLanguage == 'en' ? '🇺🇸' : '🇺🇿'),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  BookInfoDialog(book: widget.book),
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          bottom: kToolbarHeight * 2 + 15,
          left: 16,
          right: 16,
          top: 16,
        ),
        children: [
          MarkdownBody(
            data: widget.book.summary,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              p: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'share',
            shape: const CircleBorder(),
            backgroundColor: AppColors.green900,
            onPressed: () => AppFunctions.shareSummary(widget.book),
            child: SvgPicture.asset(
              AppAssets.share,
              colorFilter: const ColorFilter.mode(
                AppColors.summarizeItWhite,
                BlendMode.srcIn,
              ),
            ),
          ),
          if (widget.book.audioUrl != 'null') 5.h(),
          if (widget.book.audioUrl != 'null')
            PlayPauseAudioWidget(summaryAudioUrl: widget.book.audioUrl),
        ],
      ),
    );
  }
}