part of 'generative_ai_bloc.dart';

@freezed
class GenerativeAiStates with _$GenerativeAiStates {
  const factory GenerativeAiStates.initial() = InitialGenerativeAiState;

  const factory GenerativeAiStates.loading() = LoadingGenerativeAiState;

  const factory GenerativeAiStates.loaded({required Book book}) =
      LoadedGenerativeAiState;

  const factory GenerativeAiStates.error({required String message}) =
      ErrorGenerativeAiState;
}