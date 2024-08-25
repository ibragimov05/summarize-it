part of 'pdf_to_image_bloc.dart';

@freezed
class PdfToImageStates with _$PdfToImageStates {
  const factory PdfToImageStates.initial() = InitialPdfToImageState;

  const factory PdfToImageStates.loading({required List<Uint8List> files}) =
      LoadingPdfToImageState;

  const factory PdfToImageStates.loaded({required List<Uint8List> files}) =
      LoadedPdfToImageState;

  const factory PdfToImageStates.error({required String error}) =
      ErrorPdfToImageState;
}