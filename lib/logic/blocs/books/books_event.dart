part of 'books_bloc.dart';

@freezed
class BooksEvent with _$BooksEvent {
  const factory BooksEvent.getBooks({required String uid}) = GetBookEvent;

  const factory BooksEvent.addBook({
    required String userID,
    required Book book,
  }) = AddBookEvent;

  const factory BooksEvent.addAudioUrl({required String bookId,required String audioUrl}) =
      AddAudioUrlEvent;

  const factory BooksEvent.deleteBook({required String id}) = DeleteBookEvent;
}
