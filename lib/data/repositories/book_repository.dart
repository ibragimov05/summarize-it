import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/data/services/firebase/firebase_book_service.dart';

class BooksRepository {
  final FirebaseBookService _firebaseBookService;

  BooksRepository({required FirebaseBookService firebaseBookService})
      : _firebaseBookService = firebaseBookService;

  Stream<List<Book>> getBooks({required String uid}) =>
      _firebaseBookService.getBooks(uid);

  void addBook(Book book) => _firebaseBookService.addBok(book);

  void deleteBook(String id) {
    _firebaseBookService.deleteBook(id);
  }
}
