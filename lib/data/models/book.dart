import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  String userId;
  final String title;
  final String summary;
  final String author;
  final num rate;
  final num rateOfTheBook;
  final String categoryOfBook;
  String audioUrl;
  final Timestamp bookPublishedDate;
  final Timestamp summaryAddedDate;
  final List<String> facts;

  Book({
    required this.id,
    required this.userId,
    required this.title,
    required this.summary,
    required this.author,
    required this.rate,
    required this.rateOfTheBook,
    required this.categoryOfBook,
    required this.audioUrl,
    required this.bookPublishedDate,
    required this.summaryAddedDate,
    required this.facts,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? DateTime.now().microsecondsSinceEpoch.toString(),
      userId: map['user-uid'] ?? 'null',
      title: map['title'] ?? 'null',
      summary: map['summary'] ?? 'null',
      author: map['author'] ?? 'null',
      rate: map['rate'] ?? 0.0,
      rateOfTheBook: map['rate-of-the-book'] ?? 0.0,
      categoryOfBook: map['category-of-book'] ?? 'null',
      audioUrl: map['audio-url'] ?? 'null',
      bookPublishedDate: map['published-date'] ?? Timestamp.now(),
      summaryAddedDate: map['summary-added-date'] ?? Timestamp.now(),
      facts: List<String>.from(map['facts'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user-uid': userId,
      'title': title,
      'summary': summary,
      'author': author,
      'rate': rate,
      'rate-of-the-book': rateOfTheBook,
      'category-of-book': categoryOfBook,
      'published-date': bookPublishedDate,
      'summary-added-date': Timestamp.now(),
      'facts': facts,
      'audio-url': audioUrl,
    };
  }
}
