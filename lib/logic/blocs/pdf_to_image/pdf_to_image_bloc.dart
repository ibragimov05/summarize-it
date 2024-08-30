import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

part 'pdf_to_image_events.dart';

part 'pdf_to_image_states.dart';

class PdfToImageBloc extends Bloc<PdfToImageEvents, PdfToImageStates> {
  PdfToImageBloc() : super(const InitialPdfToImageState()) {
    on<ConvertPdfToImageEvent>(_onConvertPdfToImage);
    on<ToInitialStatePdfToImageEvent>(_toInitialState);
  }

  void _onConvertPdfToImage(
    ConvertPdfToImageEvent event,
    emit,
  ) async {
    event.buttonController.start();
    try {
      final pdf = PdfImageRendererPdf(path: event.file.path);

      await pdf.open();
      int pageCount = await pdf.getPageCount();

      List<Uint8List> selectedImages = [];

      for (var i = 0; i < pageCount.clamp(0, 50); i++) {
        await pdf.openPage(pageIndex: i);
        final size = await pdf.getPageSize(pageIndex: i);
        final img = await pdf.renderPage(
          pageIndex: i,
          x: 0,
          y: 0,
          width: size.width,
          height: size.height,
          scale: 1,
          background: Colors.white,
        );
        await pdf.closePage(pageIndex: i);

        if (img != null) {
          selectedImages.add(img);
          emit(LoadingPdfToImageState(files: selectedImages));
        }
      }

      emit(LoadedPdfToImageState(files: selectedImages));

      pdf.close();
    } catch (e) {
      emit(ErrorPdfToImageState(error: e.toString()));
    } finally {
      event.buttonController.reset();
    }
  }

  void _toInitialState(
    ToInitialStatePdfToImageEvent event,
    Emitter<PdfToImageStates> emit,
  ) =>
      emit(const InitialPdfToImageState());
}
