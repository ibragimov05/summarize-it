part of 'generative_ai_bloc.dart';

sealed class GenerativeAiEvents {}

final class SummarizeAiEvent extends GenerativeAiEvents {
  final List<Uint8List> files;
  final SummaryLength summaryLength;
  final SummaryLanguage summaryLanguage;
  final RoundedLoadingButtonController buttonController;

  SummarizeAiEvent({
    required this.files,
    required this.summaryLength,
    required this.summaryLanguage,
    required this.buttonController,
  });
}

final class ToInitialGenerativeAiEvent extends GenerativeAiEvents {}
