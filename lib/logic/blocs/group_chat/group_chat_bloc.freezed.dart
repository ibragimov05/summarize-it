// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllMessages,
    required TResult Function(String text, String senderId, String senderName)
        sendMessage,
    required TResult Function(String messageId, String newMessage) editMessage,
    required TResult Function(String messageId) deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllMessages,
    TResult? Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult? Function(String messageId, String newMessage)? editMessage,
    TResult? Function(String messageId)? deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllMessages,
    TResult Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult Function(String messageId, String newMessage)? editMessage,
    TResult Function(String messageId)? deleteMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllMessagesEvent value) getAllMessages,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(EditMessageEvent value) editMessage,
    required TResult Function(DeleteMessageEvent value) deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllMessagesEvent value)? getAllMessages,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(EditMessageEvent value)? editMessage,
    TResult? Function(DeleteMessageEvent value)? deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllMessagesEvent value)? getAllMessages,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(EditMessageEvent value)? editMessage,
    TResult Function(DeleteMessageEvent value)? deleteMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupChatEventCopyWith<$Res> {
  factory $GroupChatEventCopyWith(
          GroupChatEvent value, $Res Function(GroupChatEvent) then) =
      _$GroupChatEventCopyWithImpl<$Res, GroupChatEvent>;
}

/// @nodoc
class _$GroupChatEventCopyWithImpl<$Res, $Val extends GroupChatEvent>
    implements $GroupChatEventCopyWith<$Res> {
  _$GroupChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllMessagesEventImplCopyWith<$Res> {
  factory _$$GetAllMessagesEventImplCopyWith(_$GetAllMessagesEventImpl value,
          $Res Function(_$GetAllMessagesEventImpl) then) =
      __$$GetAllMessagesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllMessagesEventImplCopyWithImpl<$Res>
    extends _$GroupChatEventCopyWithImpl<$Res, _$GetAllMessagesEventImpl>
    implements _$$GetAllMessagesEventImplCopyWith<$Res> {
  __$$GetAllMessagesEventImplCopyWithImpl(_$GetAllMessagesEventImpl _value,
      $Res Function(_$GetAllMessagesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllMessagesEventImpl implements GetAllMessagesEvent {
  const _$GetAllMessagesEventImpl();

  @override
  String toString() {
    return 'GroupChatEvent.getAllMessages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllMessagesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllMessages,
    required TResult Function(String text, String senderId, String senderName)
        sendMessage,
    required TResult Function(String messageId, String newMessage) editMessage,
    required TResult Function(String messageId) deleteMessage,
  }) {
    return getAllMessages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllMessages,
    TResult? Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult? Function(String messageId, String newMessage)? editMessage,
    TResult? Function(String messageId)? deleteMessage,
  }) {
    return getAllMessages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllMessages,
    TResult Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult Function(String messageId, String newMessage)? editMessage,
    TResult Function(String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (getAllMessages != null) {
      return getAllMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllMessagesEvent value) getAllMessages,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(EditMessageEvent value) editMessage,
    required TResult Function(DeleteMessageEvent value) deleteMessage,
  }) {
    return getAllMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllMessagesEvent value)? getAllMessages,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(EditMessageEvent value)? editMessage,
    TResult? Function(DeleteMessageEvent value)? deleteMessage,
  }) {
    return getAllMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllMessagesEvent value)? getAllMessages,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(EditMessageEvent value)? editMessage,
    TResult Function(DeleteMessageEvent value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (getAllMessages != null) {
      return getAllMessages(this);
    }
    return orElse();
  }
}

abstract class GetAllMessagesEvent implements GroupChatEvent {
  const factory GetAllMessagesEvent() = _$GetAllMessagesEventImpl;
}

/// @nodoc
abstract class _$$SendMessageEventImplCopyWith<$Res> {
  factory _$$SendMessageEventImplCopyWith(_$SendMessageEventImpl value,
          $Res Function(_$SendMessageEventImpl) then) =
      __$$SendMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, String senderId, String senderName});
}

/// @nodoc
class __$$SendMessageEventImplCopyWithImpl<$Res>
    extends _$GroupChatEventCopyWithImpl<$Res, _$SendMessageEventImpl>
    implements _$$SendMessageEventImplCopyWith<$Res> {
  __$$SendMessageEventImplCopyWithImpl(_$SendMessageEventImpl _value,
      $Res Function(_$SendMessageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? senderId = null,
    Object? senderName = null,
  }) {
    return _then(_$SendMessageEventImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageEventImpl implements SendMessageEvent {
  const _$SendMessageEventImpl(
      {required this.text, required this.senderId, required this.senderName});

  @override
  final String text;
  @override
  final String senderId;
  @override
  final String senderName;

  @override
  String toString() {
    return 'GroupChatEvent.sendMessage(text: $text, senderId: $senderId, senderName: $senderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageEventImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, senderId, senderName);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      __$$SendMessageEventImplCopyWithImpl<_$SendMessageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllMessages,
    required TResult Function(String text, String senderId, String senderName)
        sendMessage,
    required TResult Function(String messageId, String newMessage) editMessage,
    required TResult Function(String messageId) deleteMessage,
  }) {
    return sendMessage(text, senderId, senderName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllMessages,
    TResult? Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult? Function(String messageId, String newMessage)? editMessage,
    TResult? Function(String messageId)? deleteMessage,
  }) {
    return sendMessage?.call(text, senderId, senderName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllMessages,
    TResult Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult Function(String messageId, String newMessage)? editMessage,
    TResult Function(String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(text, senderId, senderName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllMessagesEvent value) getAllMessages,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(EditMessageEvent value) editMessage,
    required TResult Function(DeleteMessageEvent value) deleteMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllMessagesEvent value)? getAllMessages,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(EditMessageEvent value)? editMessage,
    TResult? Function(DeleteMessageEvent value)? deleteMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllMessagesEvent value)? getAllMessages,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(EditMessageEvent value)? editMessage,
    TResult Function(DeleteMessageEvent value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessageEvent implements GroupChatEvent {
  const factory SendMessageEvent(
      {required final String text,
      required final String senderId,
      required final String senderName}) = _$SendMessageEventImpl;

  String get text;
  String get senderId;
  String get senderName;

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditMessageEventImplCopyWith<$Res> {
  factory _$$EditMessageEventImplCopyWith(_$EditMessageEventImpl value,
          $Res Function(_$EditMessageEventImpl) then) =
      __$$EditMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String messageId, String newMessage});
}

/// @nodoc
class __$$EditMessageEventImplCopyWithImpl<$Res>
    extends _$GroupChatEventCopyWithImpl<$Res, _$EditMessageEventImpl>
    implements _$$EditMessageEventImplCopyWith<$Res> {
  __$$EditMessageEventImplCopyWithImpl(_$EditMessageEventImpl _value,
      $Res Function(_$EditMessageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? newMessage = null,
  }) {
    return _then(_$EditMessageEventImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      newMessage: null == newMessage
          ? _value.newMessage
          : newMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditMessageEventImpl implements EditMessageEvent {
  const _$EditMessageEventImpl(
      {required this.messageId, required this.newMessage});

  @override
  final String messageId;
  @override
  final String newMessage;

  @override
  String toString() {
    return 'GroupChatEvent.editMessage(messageId: $messageId, newMessage: $newMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMessageEventImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.newMessage, newMessage) ||
                other.newMessage == newMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId, newMessage);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMessageEventImplCopyWith<_$EditMessageEventImpl> get copyWith =>
      __$$EditMessageEventImplCopyWithImpl<_$EditMessageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllMessages,
    required TResult Function(String text, String senderId, String senderName)
        sendMessage,
    required TResult Function(String messageId, String newMessage) editMessage,
    required TResult Function(String messageId) deleteMessage,
  }) {
    return editMessage(messageId, newMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllMessages,
    TResult? Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult? Function(String messageId, String newMessage)? editMessage,
    TResult? Function(String messageId)? deleteMessage,
  }) {
    return editMessage?.call(messageId, newMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllMessages,
    TResult Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult Function(String messageId, String newMessage)? editMessage,
    TResult Function(String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (editMessage != null) {
      return editMessage(messageId, newMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllMessagesEvent value) getAllMessages,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(EditMessageEvent value) editMessage,
    required TResult Function(DeleteMessageEvent value) deleteMessage,
  }) {
    return editMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllMessagesEvent value)? getAllMessages,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(EditMessageEvent value)? editMessage,
    TResult? Function(DeleteMessageEvent value)? deleteMessage,
  }) {
    return editMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllMessagesEvent value)? getAllMessages,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(EditMessageEvent value)? editMessage,
    TResult Function(DeleteMessageEvent value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (editMessage != null) {
      return editMessage(this);
    }
    return orElse();
  }
}

abstract class EditMessageEvent implements GroupChatEvent {
  const factory EditMessageEvent(
      {required final String messageId,
      required final String newMessage}) = _$EditMessageEventImpl;

  String get messageId;
  String get newMessage;

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditMessageEventImplCopyWith<_$EditMessageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMessageEventImplCopyWith<$Res> {
  factory _$$DeleteMessageEventImplCopyWith(_$DeleteMessageEventImpl value,
          $Res Function(_$DeleteMessageEventImpl) then) =
      __$$DeleteMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String messageId});
}

/// @nodoc
class __$$DeleteMessageEventImplCopyWithImpl<$Res>
    extends _$GroupChatEventCopyWithImpl<$Res, _$DeleteMessageEventImpl>
    implements _$$DeleteMessageEventImplCopyWith<$Res> {
  __$$DeleteMessageEventImplCopyWithImpl(_$DeleteMessageEventImpl _value,
      $Res Function(_$DeleteMessageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_$DeleteMessageEventImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteMessageEventImpl implements DeleteMessageEvent {
  const _$DeleteMessageEventImpl({required this.messageId});

  @override
  final String messageId;

  @override
  String toString() {
    return 'GroupChatEvent.deleteMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMessageEventImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMessageEventImplCopyWith<_$DeleteMessageEventImpl> get copyWith =>
      __$$DeleteMessageEventImplCopyWithImpl<_$DeleteMessageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllMessages,
    required TResult Function(String text, String senderId, String senderName)
        sendMessage,
    required TResult Function(String messageId, String newMessage) editMessage,
    required TResult Function(String messageId) deleteMessage,
  }) {
    return deleteMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllMessages,
    TResult? Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult? Function(String messageId, String newMessage)? editMessage,
    TResult? Function(String messageId)? deleteMessage,
  }) {
    return deleteMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllMessages,
    TResult Function(String text, String senderId, String senderName)?
        sendMessage,
    TResult Function(String messageId, String newMessage)? editMessage,
    TResult Function(String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllMessagesEvent value) getAllMessages,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(EditMessageEvent value) editMessage,
    required TResult Function(DeleteMessageEvent value) deleteMessage,
  }) {
    return deleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllMessagesEvent value)? getAllMessages,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(EditMessageEvent value)? editMessage,
    TResult? Function(DeleteMessageEvent value)? deleteMessage,
  }) {
    return deleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllMessagesEvent value)? getAllMessages,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(EditMessageEvent value)? editMessage,
    TResult Function(DeleteMessageEvent value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(this);
    }
    return orElse();
  }
}

abstract class DeleteMessageEvent implements GroupChatEvent {
  const factory DeleteMessageEvent({required final String messageId}) =
      _$DeleteMessageEventImpl;

  String get messageId;

  /// Create a copy of GroupChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteMessageEventImplCopyWith<_$DeleteMessageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GroupChatState {
  List<Message>? get messages => throw _privateConstructorUsedError;
  GroupChatStatus get chatStatus => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of GroupChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupChatStateCopyWith<GroupChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupChatStateCopyWith<$Res> {
  factory $GroupChatStateCopyWith(
          GroupChatState value, $Res Function(GroupChatState) then) =
      _$GroupChatStateCopyWithImpl<$Res, GroupChatState>;
  @useResult
  $Res call(
      {List<Message>? messages, GroupChatStatus chatStatus, String? error});
}

/// @nodoc
class _$GroupChatStateCopyWithImpl<$Res, $Val extends GroupChatState>
    implements $GroupChatStateCopyWith<$Res> {
  _$GroupChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? chatStatus = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as GroupChatStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupChatStateImplCopyWith<$Res>
    implements $GroupChatStateCopyWith<$Res> {
  factory _$$GroupChatStateImplCopyWith(_$GroupChatStateImpl value,
          $Res Function(_$GroupChatStateImpl) then) =
      __$$GroupChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Message>? messages, GroupChatStatus chatStatus, String? error});
}

/// @nodoc
class __$$GroupChatStateImplCopyWithImpl<$Res>
    extends _$GroupChatStateCopyWithImpl<$Res, _$GroupChatStateImpl>
    implements _$$GroupChatStateImplCopyWith<$Res> {
  __$$GroupChatStateImplCopyWithImpl(
      _$GroupChatStateImpl _value, $Res Function(_$GroupChatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? chatStatus = null,
    Object? error = freezed,
  }) {
    return _then(_$GroupChatStateImpl(
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as GroupChatStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GroupChatStateImpl implements _GroupChatState {
  const _$GroupChatStateImpl(
      {final List<Message>? messages,
      this.chatStatus = GroupChatStatus.initial,
      this.error})
      : _messages = messages;

  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final GroupChatStatus chatStatus;
  @override
  final String? error;

  @override
  String toString() {
    return 'GroupChatState(messages: $messages, chatStatus: $chatStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupChatStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.chatStatus, chatStatus) ||
                other.chatStatus == chatStatus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messages), chatStatus, error);

  /// Create a copy of GroupChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupChatStateImplCopyWith<_$GroupChatStateImpl> get copyWith =>
      __$$GroupChatStateImplCopyWithImpl<_$GroupChatStateImpl>(
          this, _$identity);
}

abstract class _GroupChatState implements GroupChatState {
  const factory _GroupChatState(
      {final List<Message>? messages,
      final GroupChatStatus chatStatus,
      final String? error}) = _$GroupChatStateImpl;

  @override
  List<Message>? get messages;
  @override
  GroupChatStatus get chatStatus;
  @override
  String? get error;

  /// Create a copy of GroupChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupChatStateImplCopyWith<_$GroupChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
