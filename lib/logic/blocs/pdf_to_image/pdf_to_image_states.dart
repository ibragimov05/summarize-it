part of 'pdf_to_image_bloc.dart';

sealed class PdfToImageStates {}

final class InitialPdfToImageState extends PdfToImageStates {}

final class LoadingPdfToImageState extends PdfToImageStates {
  final List<Uint8List> files;

  LoadingPdfToImageState({required this.files});
}

final class LoadedPdfToImageState extends PdfToImageStates {
  final List<Uint8List> files;

  LoadedPdfToImageState({required this.files});
}

final class ErrorPdfToImageState extends PdfToImageStates {
  final String error;

  ErrorPdfToImageState({required this.error});
}
