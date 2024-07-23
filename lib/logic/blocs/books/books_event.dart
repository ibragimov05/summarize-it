part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class GetBookEvent extends BooksEvent {}

final class AddBookEvent extends BooksEvent {
  final Book book;

  AddBookEvent({required this.book});
}
