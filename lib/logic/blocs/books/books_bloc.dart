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
    required BooksRepository bookRepository,
  })  : _bookRepository = bookRepository,
        super(const BooksState.initial()) {
    on<GetBookEvent>(_getBooks);
    on<AddBookEvent>(_addBook);
    on<AddAudioUrlEvent>(_addAudioUrl);
    on<DeleteBookEvent>(_deleteBook);
  }

  Future<void> _getBooks(GetBookEvent event, Emitter<BooksState> emit) async {
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

  Future<void> _addBook(AddBookEvent event, Emitter<BooksState> emit) async {
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

  Future<void> _addAudioUrl(
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

  Future<void> _deleteBook(
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