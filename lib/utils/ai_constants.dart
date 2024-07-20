enum SummaryLength {
  short,
  medium,
  long,
}

class AiConstants {
  static String summarizePrompt(String summaryLength) {
    return ''' I have a book that I need summarized. Please read the entire book 
        and provide a $summaryLength comprehensive summary that covers the main points, 
        key themes, and important details. Break down the summary by 
        chapters or sections if possible, and ensure that the summary captures 
        the essence of the book's message and content. Additionally, highlight 
        any significant quotes or passages that stand out. 
        Here is the text of the book: ''';
  }
}
