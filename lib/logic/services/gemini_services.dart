import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static Future<String?> summarize({required List<Uint8List> images}) async {
    final GenerativeModel model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: dotenv.get('GEMINI_API_KEY'),
    );

    List<DataPart> dataParts = [];

    for (Uint8List image in images) {
      dataParts.add(DataPart('image/jpeg', image));
    }
    //
    final List<Content> content = [
      Content.multi(
        [
          TextPart("""
        I have a book that I need summarized. Please read the entire book 
        and provide a comprehensive summary that covers the main points, 
        key themes, and important details. Break down the summary by 
        chapters or sections if possible, and ensure that the summary captures 
        the essence of the book's message and content. Additionally, highlight 
        any significant quotes or passages that stand out. 
        Here is the text of the book: 
        """),
          ...dataParts
        ],
      ),
    ];

    final GenerateContentResponse response =
        await model.generateContent(content);

    return response.text;
  }
}
