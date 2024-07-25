part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class GetBookEvent extends BooksEvent {}

final class AddBookEvent extends BooksEvent {
  final Book book;

  AddBookEvent({required this.book});
}

final class DeleteBookEvent extends BooksEvent {
  final String id;

  DeleteBookEvent({required this.id});
}