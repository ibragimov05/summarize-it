import 'package:cloud_firestore/cloud_firestore.dart';

class GroupChatFirebaseService {
  final CollectionReference<Map<String, dynamic>> _firestore =
      FirebaseFirestore.instance.collection('messages');

  Stream<QuerySnapshot> getMessages() async* {
    yield* _firestore.orderBy('time-stamp', descending: true).snapshots();
  }

  Future<void> sendMessage({required Map<String, dynamic> data}) async =>
      await _firestore.add(data);

  Future<void> editMessage({
    required String messageId,
    required String newMessage,
  }) async =>
      _firestore.doc(messageId).update({
        'text': newMessage,
        'is-edited': true,
      });

  Future<void> deleteMessage({required String messageId}) async =>
      _firestore.doc(messageId).delete();
}
