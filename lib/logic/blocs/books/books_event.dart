part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class GetBookEvent extends BooksEvent {
  final String uid;

  GetBookEvent({required this.uid});
}

final class AddBookEvent extends BooksEvent {
  final String userID;
  final Book book;

  AddBookEvent({required this.book, required this.userID});
}

final class AddAudioUrlEvent extends BooksEvent {
  final String bookId;
  final String audioUrl;

  AddAudioUrlEvent({required this.bookId, required this.audioUrl});
}

final class DeleteBookEvent extends BooksEvent {
  final String id;

  DeleteBookEvent({required this.id});
}
