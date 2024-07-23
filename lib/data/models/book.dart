import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String title;
  final String summary;
  final String author;
  final double rate;
  final Timestamp publishedDate;
  final List<String> facts;

  const Book({
    required this.id,
    required this.title,
    required this.summary,
    required this.author,
    required this.rate,
    required this.publishedDate,
    required this.facts,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? DateTime.now().microsecondsSinceEpoch.toString(),
      title: map['title'] ?? 'null',
      summary: map['summary'] ?? 'null',
      author: map['author'] ?? 'null',
      rate: map['rate'] ?? 0.0,
      publishedDate: Timestamp.fromDate(DateTime.parse(map['published-date'])),
      facts: List<String>.from(map['facts']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'summary': summary,
      'author': author,
      'rate': rate,
      'published-date': publishedDate,
      'facts': facts,
    };
  }
}
