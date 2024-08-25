// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserEvent,
    required TResult Function(
            String uid, String firstName, String lastName, String email)
        addNewUser,
    required TResult Function(String? secondName, String? firstName)
        updateUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserEvent,
    TResult? Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult? Function(String? secondName, String? firstName)? updateUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserEvent,
    TResult Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult Function(String? secondName, String? firstName)? updateUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(AddNewUserEvent value) addNewUser,
    required TResult Function(UpdateUserDataEvent value) updateUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(AddNewUserEvent value)? addNewUser,
    TResult? Function(UpdateUserDataEvent value)? updateUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(AddNewUserEvent value)? addNewUser,
    TResult Function(UpdateUserDataEvent value)? updateUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserEventImplCopyWith<$Res> {
  factory _$$GetUserEventImplCopyWith(
          _$GetUserEventImpl value, $Res Function(_$GetUserEventImpl) then) =
      __$$GetUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserEventImpl>
    implements _$$GetUserEventImplCopyWith<$Res> {
  __$$GetUserEventImplCopyWithImpl(
      _$GetUserEventImpl _value, $Res Function(_$GetUserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserEventImpl implements GetUserEvent {
  const _$GetUserEventImpl();

  @override
  String toString() {
    return 'UserEvent.getUserEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserEvent,
    required TResult Function(
            String uid, String firstName, String lastName, String email)
        addNewUser,
    required TResult Function(String? secondName, String? firstName)
        updateUserData,
  }) {
    return getUserEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserEvent,
    TResult? Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult? Function(String? secondName, String? firstName)? updateUserData,
  }) {
    return getUserEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserEvent,
    TResult Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult Function(String? secondName, String? firstName)? updateUserData,
    required TResult orElse(),
  }) {
    if (getUserEvent != null) {
      return getUserEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(AddNewUserEvent value) addNewUser,
    required TResult Function(UpdateUserDataEvent value) updateUserData,
  }) {
    return getUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(AddNewUserEvent value)? addNewUser,
    TResult? Function(UpdateUserDataEvent value)? updateUserData,
  }) {
    return getUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(AddNewUserEvent value)? addNewUser,
    TResult Function(UpdateUserDataEvent value)? updateUserData,
    required TResult orElse(),
  }) {
    if (getUserEvent != null) {
      return getUserEvent(this);
    }
    return orElse();
  }
}

abstract class GetUserEvent implements UserEvent {
  const factory GetUserEvent() = _$GetUserEventImpl;
}

/// @nodoc
abstract class _$$AddNewUserEventImplCopyWith<$Res> {
  factory _$$AddNewUserEventImplCopyWith(_$AddNewUserEventImpl value,
          $Res Function(_$AddNewUserEventImpl) then) =
      __$$AddNewUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid, String firstName, String lastName, String email});
}

/// @nodoc
class __$$AddNewUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$AddNewUserEventImpl>
    implements _$$AddNewUserEventImplCopyWith<$Res> {
  __$$AddNewUserEventImplCopyWithImpl(
      _$AddNewUserEventImpl _value, $Res Function(_$AddNewUserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(_$AddNewUserEventImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddNewUserEventImpl implements AddNewUserEvent {
  const _$AddNewUserEventImpl(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email});

  @override
  final String uid;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;

  @override
  String toString() {
    return 'UserEvent.addNewUser(uid: $uid, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewUserEventImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, firstName, lastName, email);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewUserEventImplCopyWith<_$AddNewUserEventImpl> get copyWith =>
      __$$AddNewUserEventImplCopyWithImpl<_$AddNewUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserEvent,
    required TResult Function(
            String uid, String firstName, String lastName, String email)
        addNewUser,
    required TResult Function(String? secondName, String? firstName)
        updateUserData,
  }) {
    return addNewUser(uid, firstName, lastName, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserEvent,
    TResult? Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult? Function(String? secondName, String? firstName)? updateUserData,
  }) {
    return addNewUser?.call(uid, firstName, lastName, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserEvent,
    TResult Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult Function(String? secondName, String? firstName)? updateUserData,
    required TResult orElse(),
  }) {
    if (addNewUser != null) {
      return addNewUser(uid, firstName, lastName, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(AddNewUserEvent value) addNewUser,
    required TResult Function(UpdateUserDataEvent value) updateUserData,
  }) {
    return addNewUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(AddNewUserEvent value)? addNewUser,
    TResult? Function(UpdateUserDataEvent value)? updateUserData,
  }) {
    return addNewUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(AddNewUserEvent value)? addNewUser,
    TResult Function(UpdateUserDataEvent value)? updateUserData,
    required TResult orElse(),
  }) {
    if (addNewUser != null) {
      return addNewUser(this);
    }
    return orElse();
  }
}

abstract class AddNewUserEvent implements UserEvent {
  const factory AddNewUserEvent(
      {required final String uid,
      required final String firstName,
      required final String lastName,
      required final String email}) = _$AddNewUserEventImpl;

  String get uid;
  String get firstName;
  String get lastName;
  String get email;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddNewUserEventImplCopyWith<_$AddNewUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserDataEventImplCopyWith<$Res> {
  factory _$$UpdateUserDataEventImplCopyWith(_$UpdateUserDataEventImpl value,
          $Res Function(_$UpdateUserDataEventImpl) then) =
      __$$UpdateUserDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? secondName, String? firstName});
}

/// @nodoc
class __$$UpdateUserDataEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserDataEventImpl>
    implements _$$UpdateUserDataEventImplCopyWith<$Res> {
  __$$UpdateUserDataEventImplCopyWithImpl(_$UpdateUserDataEventImpl _value,
      $Res Function(_$UpdateUserDataEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondName = freezed,
    Object? firstName = freezed,
  }) {
    return _then(_$UpdateUserDataEventImpl(
      secondName: freezed == secondName
          ? _value.secondName
          : secondName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateUserDataEventImpl implements UpdateUserDataEvent {
  const _$UpdateUserDataEventImpl({this.secondName, this.firstName});

  @override
  final String? secondName;
  @override
  final String? firstName;

  @override
  String toString() {
    return 'UserEvent.updateUserData(secondName: $secondName, firstName: $firstName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserDataEventImpl &&
            (identical(other.secondName, secondName) ||
                other.secondName == secondName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondName, firstName);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserDataEventImplCopyWith<_$UpdateUserDataEventImpl> get copyWith =>
      __$$UpdateUserDataEventImplCopyWithImpl<_$UpdateUserDataEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserEvent,
    required TResult Function(
            String uid, String firstName, String lastName, String email)
        addNewUser,
    required TResult Function(String? secondName, String? firstName)
        updateUserData,
  }) {
    return updateUserData(secondName, firstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserEvent,
    TResult? Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult? Function(String? secondName, String? firstName)? updateUserData,
  }) {
    return updateUserData?.call(secondName, firstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserEvent,
    TResult Function(
            String uid, String firstName, String lastName, String email)?
        addNewUser,
    TResult Function(String? secondName, String? firstName)? updateUserData,
    required TResult orElse(),
  }) {
    if (updateUserData != null) {
      return updateUserData(secondName, firstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(AddNewUserEvent value) addNewUser,
    required TResult Function(UpdateUserDataEvent value) updateUserData,
  }) {
    return updateUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(AddNewUserEvent value)? addNewUser,
    TResult? Function(UpdateUserDataEvent value)? updateUserData,
  }) {
    return updateUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(AddNewUserEvent value)? addNewUser,
    TResult Function(UpdateUserDataEvent value)? updateUserData,
    required TResult orElse(),
  }) {
    if (updateUserData != null) {
      return updateUserData(this);
    }
    return orElse();
  }
}

abstract class UpdateUserDataEvent implements UserEvent {
  const factory UpdateUserDataEvent(
      {final String? secondName,
      final String? firstName}) = _$UpdateUserDataEventImpl;

  String? get secondName;
  String? get firstName;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserDataEventImplCopyWith<_$UpdateUserDataEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  UserModel? get user => throw _privateConstructorUsedError;
  UserStatus get userStatus => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({UserModel? user, UserStatus userStatus, String? error});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userStatus = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? user, UserStatus userStatus, String? error});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userStatus = null,
    Object? error = freezed,
  }) {
    return _then(_$UserStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.user, this.userStatus = UserStatus.initial, this.error});

  @override
  final UserModel? user;
  @override
  @JsonKey()
  final UserStatus userStatus;
  @override
  final String? error;

  @override
  String toString() {
    return 'UserState(user: $user, userStatus: $userStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, userStatus, error);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final UserModel? user,
      final UserStatus userStatus,
      final String? error}) = _$UserStateImpl;

  @override
  UserModel? get user;
  @override
  UserStatus get userStatus;
  @override
  String? get error;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
