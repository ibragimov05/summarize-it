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
  }

  void _getBooks(GetBookEvent event, Emitter<BooksState> emit) {
    emit(LoadingBookState());
    try {
      emit.forEach(
        _bookRepository.getBooks(),
        onData: (books) => LoadedBookState(books: books),
      );
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }

  void _addBook(AddBookEvent event, Emitter<BooksState> emit) {
    emit(LoadingBookState());
    try {
      _bookRepository.addBook(event.book);
      emit(InitialBookState());
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }
}
