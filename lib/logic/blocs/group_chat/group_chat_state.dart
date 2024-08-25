part of 'group_chat_bloc.dart';

enum GroupChatStatus { initial, loading, loaded, error }

@freezed
class GroupChatState with _$GroupChatState {
  const factory GroupChatState({
    List<Message>? messages,
    @Default(GroupChatStatus.initial) GroupChatStatus chatStatus,
    String? error,
  }) = _GroupChatState;
}
