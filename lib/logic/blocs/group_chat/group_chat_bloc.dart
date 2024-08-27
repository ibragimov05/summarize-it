import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/user_data.dart';
import '../../../data/models/message.dart';
import '../../../data/repositories/group_chat_repository.dart';

part 'group_chat_event.dart';
part 'group_chat_state.dart';
part 'group_chat_bloc.freezed.dart';

class GroupChatBloc extends Bloc<GroupChatEvent, GroupChatState> {
  final GroupChatRepository _chatRepository;

  GroupChatBloc({required GroupChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const GroupChatState()) {
    on<GroupChatEvent>(
      (events, emit) => events.map(
        getAllMessages: (event) => _onGetAllMessages(event, emit),
        sendMessage: (event) => _onSendMessage(event, emit),
        editMessage: (event) => _onEditMessage(event, emit),
        deleteMessage: (event) => _onDeleteMessage(event, emit),
      ),
    );
  }

  void _onGetAllMessages(
    GetAllMessagesEvent event,
    Emitter<GroupChatState> emit,
  ) async {
    emit(state.copyWith(
      chatStatus: GroupChatStatus.loading,
    ));

    await emit.forEach<QuerySnapshot>(
      _chatRepository.getMessages(),
      onData: (snapshot) {
        final messages = snapshot.docs.map((doc) {
          return Message.fromQuerySnapshot(doc);
        }).toList();

        return state.copyWith(
          messages: messages,
          chatStatus: GroupChatStatus.loaded,
        );
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          error: error.toString(),
          chatStatus: GroupChatStatus.error,
        );
      },
    );
  }

  void _onSendMessage(
    SendMessageEvent event,
    Emitter<GroupChatState> emit,
  ) async {
    emit(state.copyWith(chatStatus: GroupChatStatus.loading));

    try {
      await _chatRepository.sendMessage(data: {
        'text': event.text,
        "sender-id": event.senderId,
        "sender-name": event.senderName,
        'is-edited': false,
        'sender-color': UserData.chatColor,
        "time-stamp": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        chatStatus: GroupChatStatus.error,
      ));
    }
  }

  void _onEditMessage(
    EditMessageEvent event,
    Emitter<GroupChatState> emit,
  ) async {
    emit(state.copyWith(chatStatus: GroupChatStatus.loading));

    try {
      await _chatRepository.editMessage(
        messageId: event.messageId,
        newMessage: event.newMessage,
      );
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        chatStatus: GroupChatStatus.error,
      ));
    }
  }

  void _onDeleteMessage(
    DeleteMessageEvent event,
    Emitter<GroupChatState> emit,
  ) async {
    emit(state.copyWith(chatStatus: GroupChatStatus.loading));

    try {
      await _chatRepository.deleteMessage(messageId: event.messageId);
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        chatStatus: GroupChatStatus.error,
      ));
    }
  }
}
