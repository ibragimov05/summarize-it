// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BooksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getBooks,
    required TResult Function(String userID, Book book) addBook,
    required TResult Function(String bookId, String audioUrl) addAudioUrl,
    required TResult Function(String id) deleteBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? getBooks,
    TResult? Function(String userID, Book book)? addBook,
    TResult? Function(String bookId, String audioUrl)? addAudioUrl,
    TResult? Function(String id)? deleteBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getBooks,
    TResult Function(String userID, Book book)? addBook,
    TResult Function(String bookId, String audioUrl)? addAudioUrl,
    TResult Function(String id)? deleteBook,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBookEvent value) getBooks,
    required TResult Function(AddBookEvent value) addBook,
    required TResult Function(AddAudioUrlEvent value) addAudioUrl,
    required TResult Function(DeleteBookEvent value) deleteBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBookEvent value)? getBooks,
    TResult? Function(AddBookEvent value)? addBook,
    TResult? Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult? Function(DeleteBookEvent value)? deleteBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBookEvent value)? getBooks,
    TResult Function(AddBookEvent value)? addBook,
    TResult Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult Function(DeleteBookEvent value)? deleteBook,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksEventCopyWith<$Res> {
  factory $BooksEventCopyWith(
          BooksEvent value, $Res Function(BooksEvent) then) =
      _$BooksEventCopyWithImpl<$Res, BooksEvent>;
}

/// @nodoc
class _$BooksEventCopyWithImpl<$Res, $Val extends BooksEvent>
    implements $BooksEventCopyWith<$Res> {
  _$BooksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetBookEventImplCopyWith<$Res> {
  factory _$$GetBookEventImplCopyWith(
          _$GetBookEventImpl value, $Res Function(_$GetBookEventImpl) then) =
      __$$GetBookEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$GetBookEventImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$GetBookEventImpl>
    implements _$$GetBookEventImplCopyWith<$Res> {
  __$$GetBookEventImplCopyWithImpl(
      _$GetBookEventImpl _value, $Res Function(_$GetBookEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$GetBookEventImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBookEventImpl implements GetBookEvent {
  const _$GetBookEventImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'BooksEvent.getBooks(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookEventImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBookEventImplCopyWith<_$GetBookEventImpl> get copyWith =>
      __$$GetBookEventImplCopyWithImpl<_$GetBookEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getBooks,
    required TResult Function(String userID, Book book) addBook,
    required TResult Function(String bookId, String audioUrl) addAudioUrl,
    required TResult Function(String id) deleteBook,
  }) {
    return getBooks(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? getBooks,
    TResult? Function(String userID, Book book)? addBook,
    TResult? Function(String bookId, String audioUrl)? addAudioUrl,
    TResult? Function(String id)? deleteBook,
  }) {
    return getBooks?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getBooks,
    TResult Function(String userID, Book book)? addBook,
    TResult Function(String bookId, String audioUrl)? addAudioUrl,
    TResult Function(String id)? deleteBook,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBookEvent value) getBooks,
    required TResult Function(AddBookEvent value) addBook,
    required TResult Function(AddAudioUrlEvent value) addAudioUrl,
    required TResult Function(DeleteBookEvent value) deleteBook,
  }) {
    return getBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBookEvent value)? getBooks,
    TResult? Function(AddBookEvent value)? addBook,
    TResult? Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult? Function(DeleteBookEvent value)? deleteBook,
  }) {
    return getBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBookEvent value)? getBooks,
    TResult Function(AddBookEvent value)? addBook,
    TResult Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult Function(DeleteBookEvent value)? deleteBook,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks(this);
    }
    return orElse();
  }
}

abstract class GetBookEvent implements BooksEvent {
  const factory GetBookEvent({required final String uid}) = _$GetBookEventImpl;

  String get uid;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBookEventImplCopyWith<_$GetBookEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBookEventImplCopyWith<$Res> {
  factory _$$AddBookEventImplCopyWith(
          _$AddBookEventImpl value, $Res Function(_$AddBookEventImpl) then) =
      __$$AddBookEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userID, Book book});
}

/// @nodoc
class __$$AddBookEventImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$AddBookEventImpl>
    implements _$$AddBookEventImplCopyWith<$Res> {
  __$$AddBookEventImplCopyWithImpl(
      _$AddBookEventImpl _value, $Res Function(_$AddBookEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? book = null,
  }) {
    return _then(_$AddBookEventImpl(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$AddBookEventImpl implements AddBookEvent {
  const _$AddBookEventImpl({required this.userID, required this.book});

  @override
  final String userID;
  @override
  final Book book;

  @override
  String toString() {
    return 'BooksEvent.addBook(userID: $userID, book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBookEventImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, book);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBookEventImplCopyWith<_$AddBookEventImpl> get copyWith =>
      __$$AddBookEventImplCopyWithImpl<_$AddBookEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getBooks,
    required TResult Function(String userID, Book book) addBook,
    required TResult Function(String bookId, String audioUrl) addAudioUrl,
    required TResult Function(String id) deleteBook,
  }) {
    return addBook(userID, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? getBooks,
    TResult? Function(String userID, Book book)? addBook,
    TResult? Function(String bookId, String audioUrl)? addAudioUrl,
    TResult? Function(String id)? deleteBook,
  }) {
    return addBook?.call(userID, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getBooks,
    TResult Function(String userID, Book book)? addBook,
    TResult Function(String bookId, String audioUrl)? addAudioUrl,
    TResult Function(String id)? deleteBook,
    required TResult orElse(),
  }) {
    if (addBook != null) {
      return addBook(userID, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBookEvent value) getBooks,
    required TResult Function(AddBookEvent value) addBook,
    required TResult Function(AddAudioUrlEvent value) addAudioUrl,
    required TResult Function(DeleteBookEvent value) deleteBook,
  }) {
    return addBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBookEvent value)? getBooks,
    TResult? Function(AddBookEvent value)? addBook,
    TResult? Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult? Function(DeleteBookEvent value)? deleteBook,
  }) {
    return addBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBookEvent value)? getBooks,
    TResult Function(AddBookEvent value)? addBook,
    TResult Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult Function(DeleteBookEvent value)? deleteBook,
    required TResult orElse(),
  }) {
    if (addBook != null) {
      return addBook(this);
    }
    return orElse();
  }
}

abstract class AddBookEvent implements BooksEvent {
  const factory AddBookEvent(
      {required final String userID,
      required final Book book}) = _$AddBookEventImpl;

  String get userID;
  Book get book;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddBookEventImplCopyWith<_$AddBookEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAudioUrlEventImplCopyWith<$Res> {
  factory _$$AddAudioUrlEventImplCopyWith(_$AddAudioUrlEventImpl value,
          $Res Function(_$AddAudioUrlEventImpl) then) =
      __$$AddAudioUrlEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bookId, String audioUrl});
}

/// @nodoc
class __$$AddAudioUrlEventImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$AddAudioUrlEventImpl>
    implements _$$AddAudioUrlEventImplCopyWith<$Res> {
  __$$AddAudioUrlEventImplCopyWithImpl(_$AddAudioUrlEventImpl _value,
      $Res Function(_$AddAudioUrlEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? audioUrl = null,
  }) {
    return _then(_$AddAudioUrlEventImpl(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddAudioUrlEventImpl implements AddAudioUrlEvent {
  const _$AddAudioUrlEventImpl({required this.bookId, required this.audioUrl});

  @override
  final String bookId;
  @override
  final String audioUrl;

  @override
  String toString() {
    return 'BooksEvent.addAudioUrl(bookId: $bookId, audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAudioUrlEventImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookId, audioUrl);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAudioUrlEventImplCopyWith<_$AddAudioUrlEventImpl> get copyWith =>
      __$$AddAudioUrlEventImplCopyWithImpl<_$AddAudioUrlEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getBooks,
    required TResult Function(String userID, Book book) addBook,
    required TResult Function(String bookId, String audioUrl) addAudioUrl,
    required TResult Function(String id) deleteBook,
  }) {
    return addAudioUrl(bookId, audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? getBooks,
    TResult? Function(String userID, Book book)? addBook,
    TResult? Function(String bookId, String audioUrl)? addAudioUrl,
    TResult? Function(String id)? deleteBook,
  }) {
    return addAudioUrl?.call(bookId, audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getBooks,
    TResult Function(String userID, Book book)? addBook,
    TResult Function(String bookId, String audioUrl)? addAudioUrl,
    TResult Function(String id)? deleteBook,
    required TResult orElse(),
  }) {
    if (addAudioUrl != null) {
      return addAudioUrl(bookId, audioUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBookEvent value) getBooks,
    required TResult Function(AddBookEvent value) addBook,
    required TResult Function(AddAudioUrlEvent value) addAudioUrl,
    required TResult Function(DeleteBookEvent value) deleteBook,
  }) {
    return addAudioUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBookEvent value)? getBooks,
    TResult? Function(AddBookEvent value)? addBook,
    TResult? Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult? Function(DeleteBookEvent value)? deleteBook,
  }) {
    return addAudioUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBookEvent value)? getBooks,
    TResult Function(AddBookEvent value)? addBook,
    TResult Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult Function(DeleteBookEvent value)? deleteBook,
    required TResult orElse(),
  }) {
    if (addAudioUrl != null) {
      return addAudioUrl(this);
    }
    return orElse();
  }
}

abstract class AddAudioUrlEvent implements BooksEvent {
  const factory AddAudioUrlEvent(
      {required final String bookId,
      required final String audioUrl}) = _$AddAudioUrlEventImpl;

  String get bookId;
  String get audioUrl;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAudioUrlEventImplCopyWith<_$AddAudioUrlEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBookEventImplCopyWith<$Res> {
  factory _$$DeleteBookEventImplCopyWith(_$DeleteBookEventImpl value,
          $Res Function(_$DeleteBookEventImpl) then) =
      __$$DeleteBookEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteBookEventImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$DeleteBookEventImpl>
    implements _$$DeleteBookEventImplCopyWith<$Res> {
  __$$DeleteBookEventImplCopyWithImpl(
      _$DeleteBookEventImpl _value, $Res Function(_$DeleteBookEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteBookEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBookEventImpl implements DeleteBookEvent {
  const _$DeleteBookEventImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'BooksEvent.deleteBook(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBookEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBookEventImplCopyWith<_$DeleteBookEventImpl> get copyWith =>
      __$$DeleteBookEventImplCopyWithImpl<_$DeleteBookEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getBooks,
    required TResult Function(String userID, Book book) addBook,
    required TResult Function(String bookId, String audioUrl) addAudioUrl,
    required TResult Function(String id) deleteBook,
  }) {
    return deleteBook(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? getBooks,
    TResult? Function(String userID, Book book)? addBook,
    TResult? Function(String bookId, String audioUrl)? addAudioUrl,
    TResult? Function(String id)? deleteBook,
  }) {
    return deleteBook?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getBooks,
    TResult Function(String userID, Book book)? addBook,
    TResult Function(String bookId, String audioUrl)? addAudioUrl,
    TResult Function(String id)? deleteBook,
    required TResult orElse(),
  }) {
    if (deleteBook != null) {
      return deleteBook(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBookEvent value) getBooks,
    required TResult Function(AddBookEvent value) addBook,
    required TResult Function(AddAudioUrlEvent value) addAudioUrl,
    required TResult Function(DeleteBookEvent value) deleteBook,
  }) {
    return deleteBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBookEvent value)? getBooks,
    TResult? Function(AddBookEvent value)? addBook,
    TResult? Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult? Function(DeleteBookEvent value)? deleteBook,
  }) {
    return deleteBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBookEvent value)? getBooks,
    TResult Function(AddBookEvent value)? addBook,
    TResult Function(AddAudioUrlEvent value)? addAudioUrl,
    TResult Function(DeleteBookEvent value)? deleteBook,
    required TResult orElse(),
  }) {
    if (deleteBook != null) {
      return deleteBook(this);
    }
    return orElse();
  }
}

abstract class DeleteBookEvent implements BooksEvent {
  const factory DeleteBookEvent({required final String id}) =
      _$DeleteBookEventImpl;

  String get id;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteBookEventImplCopyWith<_$DeleteBookEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialBookStateImplCopyWith<$Res> {
  factory _$$InitialBookStateImplCopyWith(_$InitialBookStateImpl value,
          $Res Function(_$InitialBookStateImpl) then) =
      __$$InitialBookStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialBookStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$InitialBookStateImpl>
    implements _$$InitialBookStateImplCopyWith<$Res> {
  __$$InitialBookStateImplCopyWithImpl(_$InitialBookStateImpl _value,
      $Res Function(_$InitialBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialBookStateImpl implements InitialBookState {
  const _$InitialBookStateImpl();

  @override
  String toString() {
    return 'BooksState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialBookStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialBookState implements BooksState {
  const factory InitialBookState() = _$InitialBookStateImpl;
}

/// @nodoc
abstract class _$$LoadingBookStateImplCopyWith<$Res> {
  factory _$$LoadingBookStateImplCopyWith(_$LoadingBookStateImpl value,
          $Res Function(_$LoadingBookStateImpl) then) =
      __$$LoadingBookStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingBookStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$LoadingBookStateImpl>
    implements _$$LoadingBookStateImplCopyWith<$Res> {
  __$$LoadingBookStateImplCopyWithImpl(_$LoadingBookStateImpl _value,
      $Res Function(_$LoadingBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingBookStateImpl implements LoadingBookState {
  const _$LoadingBookStateImpl();

  @override
  String toString() {
    return 'BooksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingBookStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingBookState implements BooksState {
  const factory LoadingBookState() = _$LoadingBookStateImpl;
}

/// @nodoc
abstract class _$$LoadedBookStateImplCopyWith<$Res> {
  factory _$$LoadedBookStateImplCopyWith(_$LoadedBookStateImpl value,
          $Res Function(_$LoadedBookStateImpl) then) =
      __$$LoadedBookStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books});
}

/// @nodoc
class __$$LoadedBookStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$LoadedBookStateImpl>
    implements _$$LoadedBookStateImplCopyWith<$Res> {
  __$$LoadedBookStateImplCopyWithImpl(
      _$LoadedBookStateImpl _value, $Res Function(_$LoadedBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$LoadedBookStateImpl(
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$LoadedBookStateImpl implements LoadedBookState {
  const _$LoadedBookStateImpl(final List<Book> books) : _books = books;

  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'BooksState.loaded(books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedBookStateImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedBookStateImplCopyWith<_$LoadedBookStateImpl> get copyWith =>
      __$$LoadedBookStateImplCopyWithImpl<_$LoadedBookStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) {
    return loaded(books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedBookState implements BooksState {
  const factory LoadedBookState(final List<Book> books) = _$LoadedBookStateImpl;

  List<Book> get books;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedBookStateImplCopyWith<_$LoadedBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBookSuccessStateImplCopyWith<$Res> {
  factory _$$AddBookSuccessStateImplCopyWith(_$AddBookSuccessStateImpl value,
          $Res Function(_$AddBookSuccessStateImpl) then) =
      __$$AddBookSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String addedBookId});
}

/// @nodoc
class __$$AddBookSuccessStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$AddBookSuccessStateImpl>
    implements _$$AddBookSuccessStateImplCopyWith<$Res> {
  __$$AddBookSuccessStateImplCopyWithImpl(_$AddBookSuccessStateImpl _value,
      $Res Function(_$AddBookSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addedBookId = null,
  }) {
    return _then(_$AddBookSuccessStateImpl(
      null == addedBookId
          ? _value.addedBookId
          : addedBookId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddBookSuccessStateImpl implements AddBookSuccessState {
  const _$AddBookSuccessStateImpl(this.addedBookId);

  @override
  final String addedBookId;

  @override
  String toString() {
    return 'BooksState.addBookSuccess(addedBookId: $addedBookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBookSuccessStateImpl &&
            (identical(other.addedBookId, addedBookId) ||
                other.addedBookId == addedBookId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addedBookId);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBookSuccessStateImplCopyWith<_$AddBookSuccessStateImpl> get copyWith =>
      __$$AddBookSuccessStateImplCopyWithImpl<_$AddBookSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) {
    return addBookSuccess(addedBookId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) {
    return addBookSuccess?.call(addedBookId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (addBookSuccess != null) {
      return addBookSuccess(addedBookId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) {
    return addBookSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) {
    return addBookSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) {
    if (addBookSuccess != null) {
      return addBookSuccess(this);
    }
    return orElse();
  }
}

abstract class AddBookSuccessState implements BooksState {
  const factory AddBookSuccessState(final String addedBookId) =
      _$AddBookSuccessStateImpl;

  String get addedBookId;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddBookSuccessStateImplCopyWith<_$AddBookSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorBookStateImplCopyWith<$Res> {
  factory _$$ErrorBookStateImplCopyWith(_$ErrorBookStateImpl value,
          $Res Function(_$ErrorBookStateImpl) then) =
      __$$ErrorBookStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorBookStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$ErrorBookStateImpl>
    implements _$$ErrorBookStateImplCopyWith<$Res> {
  __$$ErrorBookStateImplCopyWithImpl(
      _$ErrorBookStateImpl _value, $Res Function(_$ErrorBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorBookStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorBookStateImpl implements ErrorBookState {
  const _$ErrorBookStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BooksState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorBookStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorBookStateImplCopyWith<_$ErrorBookStateImpl> get copyWith =>
      __$$ErrorBookStateImplCopyWithImpl<_$ErrorBookStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Book> books) loaded,
    required TResult Function(String addedBookId) addBookSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books)? loaded,
    TResult? Function(String addedBookId)? addBookSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books)? loaded,
    TResult Function(String addedBookId)? addBookSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBookState value) initial,
    required TResult Function(LoadingBookState value) loading,
    required TResult Function(LoadedBookState value) loaded,
    required TResult Function(AddBookSuccessState value) addBookSuccess,
    required TResult Function(ErrorBookState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookState value)? initial,
    TResult? Function(LoadingBookState value)? loading,
    TResult? Function(LoadedBookState value)? loaded,
    TResult? Function(AddBookSuccessState value)? addBookSuccess,
    TResult? Function(ErrorBookState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookState value)? initial,
    TResult Function(LoadingBookState value)? loading,
    TResult Function(LoadedBookState value)? loaded,
    TResult Function(AddBookSuccessState value)? addBookSuccess,
    TResult Function(ErrorBookState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorBookState implements BooksState {
  const factory ErrorBookState(final String message) = _$ErrorBookStateImpl;

  String get message;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorBookStateImplCopyWith<_$ErrorBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
