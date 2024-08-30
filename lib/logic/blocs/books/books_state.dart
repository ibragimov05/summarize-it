part of 'books_bloc.dart';

@freezed
class BooksState with _$BooksState {
  const factory BooksState.initial() = InitialBookState;
  const factory BooksState.loading() = LoadingBookState;
  const factory BooksState.loaded(List<Book> books) = LoadedBookState;
  const factory BooksState.addBookSuccess(String addedBookId) =
      AddBookSuccessState;
  const factory BooksState.error(String message) = ErrorBookState;
}
