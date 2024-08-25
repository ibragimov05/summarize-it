part of 'generative_ai_bloc.dart';

@freezed
class GenerativeAiEvents with _$GenerativeAiEvents {
  const factory GenerativeAiEvents.summarize({
    required List<Uint8List> files,
    required SummaryLength summaryLength,
    required SummaryLanguage summaryLanguage,
    required RoundedLoadingButtonController buttonController,
  }) = SummarizeAiEvent;

  const factory GenerativeAiEvents.toInitial() = ToInitialGenerativeAiEvent;
}
