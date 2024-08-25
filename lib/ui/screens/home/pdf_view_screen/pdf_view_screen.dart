import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../../app_settings.dart';
import '../../../widgets/widgets.dart';
import '../../../../core/utils/utils.dart';
import '../../../../logic/cubits/dark_theme/dark_theme_cubit.dart';
import '../../../../logic/cubits/pdf_page_cubit/pdf_page_cubit.dart';

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
  Widget build(BuildContext context) => BlocProvider.value(
        value: getIt.get<PdfPageCubit>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Book'),
            leading: const ArrowBackButton(),
          ),
          body: BlocBuilder<DarkThemeCubit, bool>(
            builder: (context, state) => Stack(
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
            ),
          ),
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 55,
                decoration: BoxDecoration(
                  color: AppFunctions.isLight(context)
                      ? AppColors.green900.withOpacity(0.1)
                      : AppColors.greyscale100.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BlocBuilder<PdfPageCubit, Map<String, int>>(
                  builder: (context, state) => Center(
                    child: Text(
                      'Page ${state["currentPage"]! + 1} out of ${state["totalPages"] ?? 0}',
                      style: AppTextStyles.workSansW600.copyWith(
                        color: AppColors.green900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
