import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summarize_it/data/models/book.dart';

class FirebaseBookService {
  final CollectionReference<Map<String, dynamic>> _bookCollection =
      FirebaseFirestore.instance.collection('books');

  Stream<List<Book>> getBooks() {
    return _bookCollection
        .orderBy('published-date', descending: false)
        .snapshots()
        .map(
          (QuerySnapshot<Map<String, dynamic>> querySnapshot) => querySnapshot
              .docs
              .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
            Map<String, dynamic> data = doc.data();
            data['id'] = doc.id;
            return Book.fromMap(data);
          }).toList(),
        );
  }

  void addBok(Book book) {
    try {
      _bookCollection.add(book.toMap());
    } catch (e) {
      rethrow;
    }
  }

  void deleteBook(String id) {
    try {
      _bookCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
