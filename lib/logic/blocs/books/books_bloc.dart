import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/book.dart';
import '../../../data/repositories/book_repository.dart';

part 'books_event.dart';
part 'books_state.dart';
part 'books_bloc.freezed.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepository _bookRepository;

  BooksBloc({
    required BooksRepository bookRepository
  })  : _bookRepository = bookRepository,
        super(const BooksState.initial()) {
    on<BooksEvent>(
      (BooksEvent events, Emitter<BooksState> emit)async {
       await events.map(
          getBooks: (GetBookEvent event) async => _onGetBooks(event, emit),
          addBook: (AddBookEvent event) async => _onAddBook(event, emit),
          addAudioUrl: (AddAudioUrlEvent event) async => _onAddAudioUrl(event, emit),
          deleteBook: (DeleteBookEvent event) async => _onDeleteBook(event, emit),
        );
      },
    );
  }

  Future<void> _onGetBooks(GetBookEvent event, Emitter<BooksState> emit) async {
    emit(const BooksState.loading());
    try {
      await emit.forEach(
        _bookRepository.getBooks(uid: event.uid),
        onData: (List<Book> books) => BooksState.loaded(books),
        onError: (error, stackTrace) => BooksState.error(error.toString()),
      );
    } catch (e) {
      emit(BooksState.error(e.toString()));
    }
  }

  Future<void> _onAddBook(AddBookEvent event, Emitter<BooksState> emit) async {
    emit(const BooksState.loading());

    try {
      event.book.userId = event.userID;
      final bookId = await _bookRepository.addBook(event.book);

      emit(BooksState.addBookSuccess(bookId));

      add(GetBookEvent(uid: FirebaseAuth.instance.currentUser!.uid));
    } catch (e) {
      emit(BooksState.error(e.toString()));
    }
  }

  Future<void> _onAddAudioUrl(
    AddAudioUrlEvent event,
    Emitter<BooksState> emit,
  ) async {
    try {
      _bookRepository.addAudioUrl(
        bookId: event.bookId,
        audioUrl: event.audioUrl,
      );
    } catch (_) {}
  }

  Future<void> _onDeleteBook(
    DeleteBookEvent event,
    Emitter<BooksState> emit,
  ) async {
    try {
      _bookRepository.deleteBook(event.id);
    } catch (e) {
      emit(BooksState.error(e.toString()));
    }
  }
}