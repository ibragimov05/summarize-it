import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String text;
  final bool isEdited;
  final int senderChatColor;
  final Timestamp timestamp;

  const Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.isEdited,
    required this.senderChatColor,
    required this.timestamp,
  });

  factory Message.fromQuerySnapshot(QueryDocumentSnapshot query) {
    return Message(
      id: query.id,
      senderId: query['sender-id'] ?? 'unknown',
      senderName: query['sender-name'] ?? 'unknown',
      text: query['text'] ?? '',
      isEdited: query['is-edited'] ?? false,
      senderChatColor: query['sender-color'] ?? 4292576568,
      timestamp: query['time-stamp'] ?? Timestamp.now(),
    );
  }
}
