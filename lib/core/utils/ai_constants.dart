enum SummaryLength {
  short,
  medium,
  long,
}

class AiConstants {
  static String summarizePrompt(SummaryLength summaryLength) {
    if (summaryLength == SummaryLength.short) {
      return shortSummary;
    } else if (summaryLength == SummaryLength.medium) {
      return mediumSummary;
    } else {
      return longSummary;
    }
  }

  static const String shortSummary = '''
      I have a book that I need summarized. 
      Please read the entire book and provide a brief summary 
      that highlights the main points and key themes. 
      Keep the summary concise, around 3-5 sentences, 
      and ensure that it captures the essence of the book's message. 
      $responseType
      Here is the text of the book: ''';

  static const String mediumSummary = '''
      I have a book that I need summarized. 
      Please read the entire book and provide a comprehensive summary 
      that covers the main points, key themes, and important details. 
      Break down the summary by major sections or chapters, if possible, 
      and ensure that it captures the essence of the book's message and content. 
      Aim for a summary length of 1-2 paragraphs. 
      $responseType
      Here is the text of the book: ''';

  static const String longSummary = '''
      I have a book that I need summarized. Please read the entire book 
      and provide a comprehensive summary that covers the main points, 
      key themes, and important details. Break down the summary by 
      chapters or sections if possible, and ensure that the summary captures 
      the essence of the book's message and content. Additionally, highlight 
      any significant quotes or passages that stand out. 
      $responseType
      Here is the text of the book: ''';

  static const String responseType = '''
      Please also add search key information such as:
      book title in string format,
      author name in string format,
      category of book in string format,
      rate of the book in number format,
      exact published date with year and month and day in the following format (YYYY-MM-DD),
      and three interesting facts about this book in List<String> format.
      
      Please, make sure that you give me the response in the following format:
      {
        "title": "...",
        "summary": "...",
        "author": "...",
        "category-of-book": "...",
        "rate-of-the-book": ...,
        "published-date": "...",
        "facts": ["...", "...", "..."],
      } 
      PLEASE DO NOT MAKE ANY MISTAKE AND GIVE ME RESPONSE AS I SAID! 
      and do not add any text outside of the curly brackets!
      ''';
}
