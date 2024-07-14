import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/logic/services/gemini/gemini_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:summarize_it/ui/screens/home_screen/widgets/greeting_message.dart';
import 'package:summarize_it/utils/app_assets.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _response;
  File? _selectedFile;
  bool isSubmitBook = false;
  final List<Uint8List> _selectedImages = [];
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _submit() async {
    try {
      _response = await GeminiService.summarize(images: _selectedImages);
      _btnController.reset();
    } catch (e) {
      if (mounted) AppFunctions.showErrorSnackBar(context, 'error: $e');
      _btnController.reset();
    } finally {
      isSubmitBook = false;
      setState(() {});
    }
  }

  void _openDocuments() async {
    _btnController.start();
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      _selectedFile = File(result.files.single.path!);
      _renderPdfImage();
    } else {
      _btnController.stop();
      debugPrint('user canceled the picker');
    }
  }

  void _renderPdfImage() async {
    final PdfImageRendererPdf pdf =
        PdfImageRendererPdf(path: _selectedFile!.path);
    await pdf.open();

    int pageCount = await pdf.getPageCount();

    for (int i = 0; i < pageCount.clamp(0, 50); i++) {
      final resultImage = await _renderPage(pdf, i);
      if (resultImage != null) {
        _selectedImages.add(resultImage);
      }
    }

    _btnController.success();
    _btnController.reset();
    pdf.close();
    isSubmitBook = true;
    setState(() {});
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_response != null)
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppAssets.icoBookmarksUn),
              ),
            ),
          Expanded(
            child: _response == null
                ? const GreetingMessage()
                : Markdown(data: _response!),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 25,
                offset: Offset(0, -10),
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10,
                top: 5,
              ),
              child: RoundedLoadingButton(
                width: MediaQuery.of(context).size.width,
                color: AppColors.green900,
                animateOnTap: true,
                controller: _btnController,
                onPressed: isSubmitBook ? _submit : _openDocuments,
                successColor: AppColors.green900,
                child: Text(
                  isSubmitBook ? 'Submit book' : 'Open documents',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
