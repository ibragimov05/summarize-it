import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../core/utils/ai_constants.dart';

part 'generative_ai_events.dart';

part 'generative_ai_states.dart';

class GenerativeAiBloc extends Bloc<GenerativeAiEvents, GenerativeAiStates> {
  GenerativeAiBloc() : super(InitialGenerativeAiState()) {
    on<SummarizeAiEvent>(_summarize);
    on<ToInitialGenerativeAiEvent>(_toInitialEvent);
  }

  void _summarize(SummarizeAiEvent event, emit) async {
    emit(LoadingGenerativeAiState());
    event.buttonController.start();
    try {
      final GenerativeModel model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: dotenv.get("GEMINI_API_KEY"),
      );

      List<DataPart> dataParts = [];

      for (Uint8List image in event.files) {
        dataParts.add(DataPart('image/jpeg', image));
      }

      final content = [
        Content.multi([
          TextPart(AiConstants.summarizePrompt(event.summaryLength.name)),
          ...dataParts,
        ]),
      ];
      final GenerateContentResponse response =
          await model.generateContent(content);

      emit(LoadedGenerativeAiState(
        result: response.text ?? "Could not fund anything",
      ));
    } catch (e) {
      emit(ErrorGenerativeAiState(message: e.toString()));
    } finally {
      event.buttonController.reset();
    }
  }

  void _toInitialEvent(
    ToInitialGenerativeAiEvent event,
    Emitter<GenerativeAiStates> emit,
  ) =>
      emit(InitialGenerativeAiState());
}
