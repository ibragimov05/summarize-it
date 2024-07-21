part of 'pdf_to_image_bloc.dart';

sealed class PdfToImageEvents {}

final class ConvertPdfToImageEvent extends PdfToImageEvents {
  final File file;
  final RoundedLoadingButtonController buttonController;
  ConvertPdfToImageEvent({required this.file,required this.buttonController});
}

final class ToInitialStatePdfToImageEvent extends PdfToImageEvents {}