part of 'pdf_to_image_bloc.dart';

@freezed
class PdfToImageEvents with _$PdfToImageEvents {
  const factory PdfToImageEvents.convert({
    required File file,
    required RoundedLoadingButtonController buttonController,
  }) = ConvertPdfToImageEvent;

  const factory PdfToImageEvents.toInitialState() = ToInitialStatePdfToImageEvent;
}
