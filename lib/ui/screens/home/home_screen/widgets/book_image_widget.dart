import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BookImageWidget extends StatelessWidget {
  final String bookPath;
  const BookImageWidget({super.key, required this.bookPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: bookPath,
      ),
    );
  }
}
