import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:summarize_it/logic/services/gemini_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _response;
  File? _selectedFile;
  final List<Uint8List> _selectedImages = [];

  void _submit() async {
    _response = await GeminiService.summarize(images: _selectedImages);
    setState(() {});
  }

  void _openDocuments() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      _selectedFile = File(result.files.single.path!);
      _renderPdfImage();
    } else {
      debugPrint('user canceled the picker');
    }
  }

  void _renderPdfImage() async {
    final PdfImageRendererPdf pdf =
    PdfImageRendererPdf(path: _selectedFile!.path);
    await pdf.open();

    int pageCount = await pdf.getPageCount();

    for (var i = 0; i < pageCount.clamp(0, 50); i++) {
      final resultImage = await _renderPage(pdf, i);
      if (resultImage != null) {
        _selectedImages.add(resultImage);
        setState(() {});
      }
    }
    pdf.close();
  }

  Future<Uint8List?> _renderPage(PdfImageRendererPdf pdf, int pageIndex) async {
    await pdf.openPage(pageIndex: pageIndex);
    final size = await pdf.getPageSize(pageIndex: pageIndex);
    final resultImage = await pdf.renderPage(
      pageIndex: pageIndex,
      x: 0,
      y: 0,
      width: size.width ~/ 2,
      height: size.height ~/ 2,
      scale: 1,
      background: Colors.white,
    );
    await pdf.closePage(pageIndex: pageIndex);
    return resultImage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Markdown(
                data: _response ?? 'Hello World!',
              ),
            ),
            SizedBox(
              height: 150,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _selectedImages
                    .map((image) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.memory(image),
                ))
                    .toList(),
              ),
            ),
            GestureDetector(
              onTap: _openDocuments,
              child: const FlutterLogo(size: 100),
            ),
            GestureDetector(
              onTap: _submit,
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
