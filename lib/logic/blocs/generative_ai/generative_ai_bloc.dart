import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../utils/ai_constants.dart';

part 'generative_ai_events.dart';

part 'generative_ai_states.dart';

class GenerativeAiBloc extends Bloc<GenerativeAiEvents, GenerativeAiStates> {
  GenerativeAiBloc() : super(InitialGenerativeAiState()) {
    on<SummarizeAiEvent>(_summarize);
  }

  void _summarize(SummarizeAiEvent event, emit) async {
    emit(LoadingGenerativeAiState());
    event.buttonController.start();
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: dotenv.get("GEMINI_API_KEY"),
      );

      List<DataPart> dataParts = [];

      for (var image in event.files) {
        dataParts.add(DataPart('image/jpeg', image));
      }

      final content = [
        Content.multi([
          TextPart(AiConstants.summarizePrompt(event.summaryLength.name)),
          ...dataParts,
        ]),
      ];
      final response = await model.generateContent(content);

      emit(LoadedGenerativeAiState(
        result: response.text ?? "Could not fund anything",
      ));
    } catch (e) {
      emit(ErrorGenerativeAiState(message: e.toString()));
    } finally {
      event.buttonController.reset();
    }
  }
}
