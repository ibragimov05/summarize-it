part of 'group_chat_bloc.dart';

@freezed
class GroupChatEvent with _$GroupChatEvent {
  const factory GroupChatEvent.getAllMessages() = GetAllMessagesEvent;

  const factory GroupChatEvent.sendMessage({
    required String text,
    required String senderId,
    required String senderName,
  }) = SendMessageEvent;

  const factory GroupChatEvent.editMessage({
    required String messageId,
    required String newMessage,
  }) = EditMessageEvent;

  const factory GroupChatEvent.deleteMessage({
    required String messageId,
  }) = DeleteMessageEvent;
}
