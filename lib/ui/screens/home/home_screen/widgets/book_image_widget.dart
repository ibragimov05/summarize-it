import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:summarize_it/logic/cubits/all_cubit.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';

class BookImageWidget extends StatelessWidget {
  final int pressedPageIndex;
  final String bookPath;
  const BookImageWidget({
    super.key,
    required this.bookPath,
    required this.pressedPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
      ),
      body: BlocBuilder<DarkThemeCubit, bool>(
        builder: (context, state) {
          return PDFView(
            filePath: bookPath,
            nightMode: state,
            autoSpacing: true,
            swipeHorizontal: false,
            defaultPage: pressedPageIndex,
          );
        },
      ),
    );
  }
}
