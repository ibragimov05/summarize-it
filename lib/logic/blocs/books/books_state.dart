part of 'books_bloc.dart';

@immutable
sealed class BooksState {}

final class InitialBookState extends BooksState {}

final class LoadingBookState extends BooksState {}

final class LoadedBookState extends BooksState {
  final List<Book> books;

  LoadedBookState({required this.books});
}

final class ErrorBookState extends BooksState {
  final String message;

  ErrorBookState({required this.message});
}
