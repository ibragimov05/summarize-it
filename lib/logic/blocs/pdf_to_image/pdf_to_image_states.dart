part of 'pdf_to_image_bloc.dart';

sealed class PdfToImageStates {
  const PdfToImageStates();
}

final class InitialPdfToImageState extends PdfToImageStates {
  const InitialPdfToImageState();
}

final class LoadingPdfToImageState extends PdfToImageStates {
  final List<Uint8List> files;

  const LoadingPdfToImageState({required this.files});
}

final class LoadedPdfToImageState extends PdfToImageStates {
  final List<Uint8List> files;

  const LoadedPdfToImageState({required this.files});
}

final class ErrorPdfToImageState extends PdfToImageStates {
  final String error;

  const ErrorPdfToImageState({required this.error});
}