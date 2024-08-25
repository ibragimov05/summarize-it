import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summarize_it/data/services/firebase/group_chat_firebase_service.dart';

class GroupChatRepository {
  final GroupChatFirebaseService _groupChatFirebaseService;

  GroupChatRepository({
    required GroupChatFirebaseService groupChatFirebaseService,
  }) : _groupChatFirebaseService = groupChatFirebaseService;

  Stream<QuerySnapshot> getMessages() async* {
   yield* _groupChatFirebaseService.getMessages();
  }

  Future<void> sendMessage({required Map<String, dynamic> data}) async =>
      await _groupChatFirebaseService.sendMessage(data: data);

  Future<void> editMessage({
    required String messageId,
    required String newMessage,
  }) async =>
      _groupChatFirebaseService.editMessage(
        messageId: messageId,
        newMessage: newMessage,
      );

  Future<void> deleteMessage({required String messageId}) async =>
      _groupChatFirebaseService.deleteMessage(messageId: messageId);
}
