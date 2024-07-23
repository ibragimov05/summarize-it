import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/data/services/firebase/firebase_book_service.dart';

class BooksRepository {
  final FirebaseBookService _firebaseBookService;

  BooksRepository({required FirebaseBookService firebaseBookService})
      : _firebaseBookService = firebaseBookService;

  Stream<List<Book>> getBooks() => _firebaseBookService.getBooks();

  void addBook(Book book) => _firebaseBookService.addBok(book);
}
