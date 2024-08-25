import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summarize_it/data/models/book.dart';

class FirebaseBookService {
  final CollectionReference<Map<String, dynamic>> _bookCollection =
      FirebaseFirestore.instance.collection('books');

  Stream<List<Book>> getBooks(String uid) =>
      _bookCollection.where('user-uid', isEqualTo: uid).snapshots().map(
            (QuerySnapshot<Map<String, dynamic>> querySnapshot) =>
                querySnapshot.docs.map(
            (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
              Map<String, dynamic> data = doc.data();
              data['id'] = doc.id;
              return Book.fromMap(data);
            },
          ).toList(),
        );

  Future<String> addBok(Book book) async {
    try {
      final response = await _bookCollection.add(
        book.toMap(),
      );
      return response.id;
    } catch (e) {
      rethrow;
    }
  }

  void addAudioUrl({required String bookId, required String audioUrl}) async =>
      _bookCollection.doc(bookId).update({'audio-url': audioUrl});

  void deleteBook(String id) {
    try {
      _bookCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
