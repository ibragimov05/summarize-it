enum SummaryLength { short, medium, long }

enum SummaryLanguage { uzbek, english, russian }

class AiConstants {
  static String summarizePrompt({
    required SummaryLength summaryLength,
    required SummaryLanguage summaryLanguage,
  }) {
    switch (summaryLength) {
      case SummaryLength.short:
        return _shortSummary + _responseLanguage(summaryLanguage);
      case SummaryLength.medium:
        return _mediumSummary + _responseLanguage(summaryLanguage);
      case SummaryLength.long:
        return _longSummary + _responseLanguage(summaryLanguage);
      default:
        return '';
    }
  }

  static String _responseLanguage(SummaryLanguage lang) {
    switch (lang) {
      case SummaryLanguage.uzbek:
        return '\nPlease ensure the entire response is in Uzbek, using the Latin alphabet. This is essential!';
      case SummaryLanguage.english:
        return '\nPlease ensure the entire response is in English. This is essential!';
      case SummaryLanguage.russian:
        return '\nPlease ensure the entire response is in Russian. This is essential!';
      default:
        return '';
    }
  }

  static const String _shortSummary = '''
      Read the entire book carefully and provide a concise summary focusing on the main points and key themes.
      The summary should be around 3-5 sentences and must accurately capture the essence of the book's message.
      $_responseType
      Here is the text of the book: ''';

  static const String _mediumSummary = '''
      Read the entire book thoroughly and provide a comprehensive summary that covers the main points, key themes, and important details.
      Summarize the content in 1-2 paragraphs, breaking it down by major sections or chapters for clarity.
      Ensure the summary reflects the book's message and content accurately.
      $_responseType
      Here is the text of the book: ''';

  static const String _longSummary = '''
      Read the entire book in detail and provide an in-depth summary that covers all major points, key themes, and important details.
      Break down the content by chapters or sections, and include significant quotes or passages that provide insights into the author's intent.
      The summary should be between 1000 to 2800 words, offering a thorough and balanced overview that reflects the book's depth.
      $_responseType
      Here is the text of the book: ''';

  static const String _responseType = '''
      The response must be in the following structured format:
      {
        "title": "The book's title as a string",
        "summary": "The generated summary as a string",
        "author": "The author's name as a string",
        "category-of-book": "The book's category or genre as a string",
        "rate-of-the-book": A numerical rating for the book (e.g., 4.5),
        "published-date": "The exact publication date in the format YYYY-MM-DD",
        "facts": ["A list of three interesting facts about the book in List<String> format"]
      }
      
      Ensure there are no syntax errors in the response.
      Do not include any additional text outside of the curly brackets!
      ''';
}
