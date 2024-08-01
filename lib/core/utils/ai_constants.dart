enum SummaryLength {
  short,
  medium,
  long,
}

class AiConstants {
  static String summarizePrompt(SummaryLength summaryLength) {
    switch (summaryLength) {
      case SummaryLength.short:
        return shortSummary;
      case SummaryLength.medium:
        return mediumSummary;
      case SummaryLength.long:
        return longSummary;
      default:
        return '';
    }
  }

  static const String shortSummary = '''
      Please read the entire book and provide a brief summary. 
      Focus on the main points and key themes, and keep the summary 
      concise—around 3-5 sentences. Ensure the summary captures 
      the essence of the book's message. $responseType
      Here is the text of the book: ''';

  static const String mediumSummary = '''
      Please read the entire book and provide a comprehensive summary. 
      Cover the main points, key themes, and important details. 
      If possible, break down the summary by major sections or chapters. 
      Aim for a length of 1-2 paragraphs, and ensure the summary 
      accurately reflects the book's message and content. $responseType
      Here is the text of the book: ''';

  // static const String longSummary = '''
  //     Please read the entire book and provide an in-depth summary.
  //     Include the main points, key themes, and important details.
  //     Break down the summary by chapters or sections if applicable,
  //     and ensure it captures the essence of the book's message and content.
  //     Additionally, highlight any significant quotes or passages.
  //     Aim for 1000 words if you can, focusing on delivering a
  //     balanced overview that reflects the book's depth and richness.
  //     $responseType
  //     Here is the text of the book: ''';

  static const String longSummary = '''
      I have a book that I need summarized, and I would 
      greatly appreciate your assistance. Could you please 
      read the entire book and provide a detailed and comprehensive 
      summary? I am looking for an overview that captures the main 
      points, key themes, and important details of the book. It would 
      be very helpful if you could break down the summary by chapters 
      or sections to ensure clarity and thoroughness. Additionally, 
      please highlight any significant quotes or passages that stand 
      out, as these often provide valuable insights into the author's 
      message and intent. Aim for 1000 plus words if you can.
      $responseType
      Here is the text of the book: ''';

  static const String responseType = '''
      Along with the summary, please include the following details:
      - "title": The book's title as a string.
      - "summary": The book's summary as generated.
      - "author": The author's name as a string.
      - "category-of-book": The book's category or genre as a string.
      - "rate-of-the-book": A numerical rating for the book (e.g., 4.5).
      - "published-date": The exact publication date in the format (YYYY-MM-DD).
      - "facts": A list of three interesting facts about the book in List<String> format.
      
      Please ensure the response is formatted as follows:
      {
        "title": "...",
        "summary": "...",
        "author": "...",
        "category-of-book": "...",
        "rate-of-the-book": ...,
        "published-date": "...",
        "facts": ["...", "...", "..."],
      }
      
      It is crucial to follow this structure precisely. 
      Do not include any additional text outside of the curly brackets!
      ''';
}
