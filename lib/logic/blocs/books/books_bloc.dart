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
    on<DeleteBookEvent>(_deleteBook);
    on<SearchBookEvent>(_searchBook);
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

  void _addBook(AddBookEvent event, Emitter<BooksState> emit) {
    emit(LoadingBookState());
    try {
      event.book.userId = event.userID;
      _bookRepository.addBook(event.book);
      emit(AddBookSuccessState());
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }

  void _deleteBook(DeleteBookEvent event, Emitter<BooksState> emit) {
    try {
      _bookRepository.deleteBook(event.id);
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }

  void _searchBook(SearchBookEvent event, Emitter<BooksState> emit) {
    try {
      final books = event.books
          .where((element) => element.title
              .toLowerCase()
              .contains(event.bookName.toLowerCase()))
          .toList();

      emit(LoadedSearchBookState(books: books));
    } catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }
}
