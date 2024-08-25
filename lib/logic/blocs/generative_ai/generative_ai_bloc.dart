import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../core/utils/utils.dart';
import '../../../data/models/book.dart';

part 'generative_ai_bloc.freezed.dart';
part 'generative_ai_events.dart';
part 'generative_ai_states.dart';

class GenerativeAiBloc extends Bloc<GenerativeAiEvents, GenerativeAiStates> {
  GenerativeAiBloc() : super(const InitialGenerativeAiState()) {
    on<SummarizeAiEvent>(_onSummarizeBook);
    on<ToInitialGenerativeAiEvent>(_toInitialEvent);
  }

  Future<void> _onSummarizeBook(
    SummarizeAiEvent event,
    Emitter<GenerativeAiStates> emit,
  ) async {
    emit(const GenerativeAiStates.loading());
    event.buttonController.start();
    try {
      final GenerativeModel model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: Apis.geminiApiKEY,
      );

      List<DataPart> dataParts = [];

      for (Uint8List image in event.files) {
        dataParts.add(DataPart('image/jpeg', image));
      }

      final content = [
        Content.multi([
          TextPart(AiConstants.summarizePrompt(
            summaryLanguage: event.summaryLanguage,
            summaryLength: event.summaryLength,
          )),
          ...dataParts,
        ]),
      ];
      final GenerateContentResponse response =
          await model.generateContent(content);

      if (response.text == null) {
        throw 'Could not find summary';
      } else {
        final data = jsonDecode(response.text!.clearJson);
        data['summary-added-date'] = Timestamp.now();
        data['published-date'] =
            Timestamp.fromDate(DateTime.parse(data['published-date']));
        data['summary-language'] =
            event.summaryLanguage == SummaryLanguage.english ? 'en' : 'uz';
        final book = Book.fromMap(data);
        emit(
          GenerativeAiStates.loaded(book: book),
        );
      }
    } catch (e) {
      emit(GenerativeAiStates.error(message: e.toString()));
    } finally {
      event.buttonController.reset();
    }
  }

  void _toInitialEvent(
    ToInitialGenerativeAiEvent event,
    Emitter<GenerativeAiStates> emit,
  ) =>
      emit(const GenerativeAiStates.initial());
}