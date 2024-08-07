import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/data/repositories/book_repository.dart';
import '../../../data/models/book.dart';

part 'books_event.dart';

part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepository _bookRepository;

  BooksBloc({required BooksRepository bookRepository})
      : _bookRepository = bookRepository,
        super(InitialBookState()) {
    on<GetBookEvent>(_getBooks);
    on<AddBookEvent>(_addBook);
    on<AddAudioUrlEvent>(_addAudioUrl);
    on<DeleteBookEvent>(_deleteBook);
  }

  void _getBooks(GetBookEvent event, Emitter<BooksState> emit) async {
    emit(LoadingBookState());
    try {
      await emit.forEach(
        _bookRepository.getBooks(uid: event.uid),
        onData: (List<Book> books) => LoadedBookState(books: books),
      );
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }

  void _addBook(AddBookEvent event, Emitter<BooksState> emit) async {
    emit(LoadingBookState());
    try {
      event.book.userId = event.userID;
      final bookId = await _bookRepository.addBook(event.book);
      emit(AddBookSuccessState(addedBookId: bookId));
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }

  void _addAudioUrl(AddAudioUrlEvent event, Emitter<BooksState> emit) {
    try {
      _bookRepository.addAudioUrl(
        bookId: event.bookId,
        audioUrl: event.audioUrl,
      );
    } catch (e) {
      debugPrint('$e');
    }
  }

  void _deleteBook(DeleteBookEvent event, Emitter<BooksState> emit) {
    try {
      _bookRepository.deleteBook(event.id);
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }
}
