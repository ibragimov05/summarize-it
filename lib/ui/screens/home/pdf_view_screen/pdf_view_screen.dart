import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/cubits/all_cubit.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';

class PdfViewScreen extends StatefulWidget {
  final int pressedPageIndex;
  final String bookPath;
  const PdfViewScreen({
    super.key,
    required this.bookPath,
    required this.pressedPageIndex,
  });

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
        leading: const ArrowBackButton(),
      ),
      body: BlocBuilder<DarkThemeCubit, bool>(
        builder: (context, state) {
          return Stack(
            children: [
              PDFView(
                filePath: widget.bookPath,
                nightMode: state,
                autoSpacing: true,
                swipeHorizontal: false,
                defaultPage: widget.pressedPageIndex,
                onPageChanged: (page, total) => context
                    .read<PdfPageCubit>()
                    .updatePage(page ?? 0, total ?? 0),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.green900.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocBuilder<PdfPageCubit, Map<String, int>>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    'Page ${state["currentPage"]! + 1} out of ${state["totalPages"] ?? 0}',
                    style: AppTextStyles.workSansW600.copyWith(
                      color: AppColors.green900,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
