// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_picker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilePickerEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectFile,
    required TResult Function() toInitialStateFilePicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectFile,
    TResult? Function()? toInitialStateFilePicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectFile,
    TResult Function()? toInitialStateFilePicker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectFileEvent value) selectFile,
    required TResult Function(ToInitialStateFilePickerEvent value)
        toInitialStateFilePicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectFileEvent value)? selectFile,
    TResult? Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectFileEvent value)? selectFile,
    TResult Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePickerEventsCopyWith<$Res> {
  factory $FilePickerEventsCopyWith(
          FilePickerEvents value, $Res Function(FilePickerEvents) then) =
      _$FilePickerEventsCopyWithImpl<$Res, FilePickerEvents>;
}

/// @nodoc
class _$FilePickerEventsCopyWithImpl<$Res, $Val extends FilePickerEvents>
    implements $FilePickerEventsCopyWith<$Res> {
  _$FilePickerEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilePickerEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectFileEventImplCopyWith<$Res> {
  factory _$$SelectFileEventImplCopyWith(_$SelectFileEventImpl value,
          $Res Function(_$SelectFileEventImpl) then) =
      __$$SelectFileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectFileEventImplCopyWithImpl<$Res>
    extends _$FilePickerEventsCopyWithImpl<$Res, _$SelectFileEventImpl>
    implements _$$SelectFileEventImplCopyWith<$Res> {
  __$$SelectFileEventImplCopyWithImpl(
      _$SelectFileEventImpl _value, $Res Function(_$SelectFileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SelectFileEventImpl implements SelectFileEvent {
  const _$SelectFileEventImpl();

  @override
  String toString() {
    return 'FilePickerEvents.selectFile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectFileEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectFile,
    required TResult Function() toInitialStateFilePicker,
  }) {
    return selectFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectFile,
    TResult? Function()? toInitialStateFilePicker,
  }) {
    return selectFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectFile,
    TResult Function()? toInitialStateFilePicker,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectFileEvent value) selectFile,
    required TResult Function(ToInitialStateFilePickerEvent value)
        toInitialStateFilePicker,
  }) {
    return selectFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectFileEvent value)? selectFile,
    TResult? Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
  }) {
    return selectFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectFileEvent value)? selectFile,
    TResult Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile(this);
    }
    return orElse();
  }
}

abstract class SelectFileEvent implements FilePickerEvents {
  const factory SelectFileEvent() = _$SelectFileEventImpl;
}

/// @nodoc
abstract class _$$ToInitialStateFilePickerEventImplCopyWith<$Res> {
  factory _$$ToInitialStateFilePickerEventImplCopyWith(
          _$ToInitialStateFilePickerEventImpl value,
          $Res Function(_$ToInitialStateFilePickerEventImpl) then) =
      __$$ToInitialStateFilePickerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToInitialStateFilePickerEventImplCopyWithImpl<$Res>
    extends _$FilePickerEventsCopyWithImpl<$Res,
        _$ToInitialStateFilePickerEventImpl>
    implements _$$ToInitialStateFilePickerEventImplCopyWith<$Res> {
  __$$ToInitialStateFilePickerEventImplCopyWithImpl(
      _$ToInitialStateFilePickerEventImpl _value,
      $Res Function(_$ToInitialStateFilePickerEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToInitialStateFilePickerEventImpl
    implements ToInitialStateFilePickerEvent {
  const _$ToInitialStateFilePickerEventImpl();

  @override
  String toString() {
    return 'FilePickerEvents.toInitialStateFilePicker()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToInitialStateFilePickerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectFile,
    required TResult Function() toInitialStateFilePicker,
  }) {
    return toInitialStateFilePicker();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectFile,
    TResult? Function()? toInitialStateFilePicker,
  }) {
    return toInitialStateFilePicker?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectFile,
    TResult Function()? toInitialStateFilePicker,
    required TResult orElse(),
  }) {
    if (toInitialStateFilePicker != null) {
      return toInitialStateFilePicker();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectFileEvent value) selectFile,
    required TResult Function(ToInitialStateFilePickerEvent value)
        toInitialStateFilePicker,
  }) {
    return toInitialStateFilePicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectFileEvent value)? selectFile,
    TResult? Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
  }) {
    return toInitialStateFilePicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectFileEvent value)? selectFile,
    TResult Function(ToInitialStateFilePickerEvent value)?
        toInitialStateFilePicker,
    required TResult orElse(),
  }) {
    if (toInitialStateFilePicker != null) {
      return toInitialStateFilePicker(this);
    }
    return orElse();
  }
}

abstract class ToInitialStateFilePickerEvent implements FilePickerEvents {
  const factory ToInitialStateFilePickerEvent() =
      _$ToInitialStateFilePickerEventImpl;
}

/// @nodoc
mixin _$FilePickerStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? filePath, File? file) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? filePath, File? file)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? filePath, File? file)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFilePickerState value) initial,
    required TResult Function(LoadingFilePickerState value) loading,
    required TResult Function(LoadedFilePickerState value) loaded,
    required TResult Function(ErrorFilePickerState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFilePickerState value)? initial,
    TResult? Function(LoadingFilePickerState value)? loading,
    TResult? Function(LoadedFilePickerState value)? loaded,
    TResult? Function(ErrorFilePickerState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFilePickerState value)? initial,
    TResult Function(LoadingFilePickerState value)? loading,
    TResult Function(LoadedFilePickerState value)? loaded,
    TResult Function(ErrorFilePickerState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePickerStatesCopyWith<$Res> {
  factory $FilePickerStatesCopyWith(
          FilePickerStates value, $Res Function(FilePickerStates) then) =
      _$FilePickerStatesCopyWithImpl<$Res, FilePickerStates>;
}

/// @nodoc
class _$FilePickerStatesCopyWithImpl<$Res, $Val extends FilePickerStates>
    implements $FilePickerStatesCopyWith<$Res> {
  _$FilePickerStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialFilePickerStateImplCopyWith<$Res> {
  factory _$$InitialFilePickerStateImplCopyWith(
          _$InitialFilePickerStateImpl value,
          $Res Function(_$InitialFilePickerStateImpl) then) =
      __$$InitialFilePickerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialFilePickerStateImplCopyWithImpl<$Res>
    extends _$FilePickerStatesCopyWithImpl<$Res, _$InitialFilePickerStateImpl>
    implements _$$InitialFilePickerStateImplCopyWith<$Res> {
  __$$InitialFilePickerStateImplCopyWithImpl(
      _$InitialFilePickerStateImpl _value,
      $Res Function(_$InitialFilePickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialFilePickerStateImpl implements InitialFilePickerState {
  const _$InitialFilePickerStateImpl();

  @override
  String toString() {
    return 'FilePickerStates.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialFilePickerStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? filePath, File? file) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? filePath, File? file)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? filePath, File? file)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(InitialFilePickerState value) initial,
    required TResult Function(LoadingFilePickerState value) loading,
    required TResult Function(LoadedFilePickerState value) loaded,
    required TResult Function(ErrorFilePickerState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFilePickerState value)? initial,
    TResult? Function(LoadingFilePickerState value)? loading,
    TResult? Function(LoadedFilePickerState value)? loaded,
    TResult? Function(ErrorFilePickerState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFilePickerState value)? initial,
    TResult Function(LoadingFilePickerState value)? loading,
    TResult Function(LoadedFilePickerState value)? loaded,
    TResult Function(ErrorFilePickerState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialFilePickerState implements FilePickerStates {
  const factory InitialFilePickerState() = _$InitialFilePickerStateImpl;
}

/// @nodoc
abstract class _$$LoadingFilePickerStateImplCopyWith<$Res> {
  factory _$$LoadingFilePickerStateImplCopyWith(
          _$LoadingFilePickerStateImpl value,
          $Res Function(_$LoadingFilePickerStateImpl) then) =
      __$$LoadingFilePickerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFilePickerStateImplCopyWithImpl<$Res>
    extends _$FilePickerStatesCopyWithImpl<$Res, _$LoadingFilePickerStateImpl>
    implements _$$LoadingFilePickerStateImplCopyWith<$Res> {
  __$$LoadingFilePickerStateImplCopyWithImpl(
      _$LoadingFilePickerStateImpl _value,
      $Res Function(_$LoadingFilePickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingFilePickerStateImpl implements LoadingFilePickerState {
  const _$LoadingFilePickerStateImpl();

  @override
  String toString() {
    return 'FilePickerStates.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingFilePickerStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? filePath, File? file) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? filePath, File? file)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? filePath, File? file)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(InitialFilePickerState value) initial,
    required TResult Function(LoadingFilePickerState value) loading,
    required TResult Function(LoadedFilePickerState value) loaded,
    required TResult Function(ErrorFilePickerState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFilePickerState value)? initial,
    TResult? Function(LoadingFilePickerState value)? loading,
    TResult? Function(LoadedFilePickerState value)? loaded,
    TResult? Function(ErrorFilePickerState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFilePickerState value)? initial,
    TResult Function(LoadingFilePickerState value)? loading,
    TResult Function(LoadedFilePickerState value)? loaded,
    TResult Function(ErrorFilePickerState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFilePickerState implements FilePickerStates {
  const factory LoadingFilePickerState() = _$LoadingFilePickerStateImpl;
}

/// @nodoc
abstract class _$$LoadedFilePickerStateImplCopyWith<$Res> {
  factory _$$LoadedFilePickerStateImplCopyWith(
          _$LoadedFilePickerStateImpl value,
          $Res Function(_$LoadedFilePickerStateImpl) then) =
      __$$LoadedFilePickerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? filePath, File? file});
}

/// @nodoc
class __$$LoadedFilePickerStateImplCopyWithImpl<$Res>
    extends _$FilePickerStatesCopyWithImpl<$Res, _$LoadedFilePickerStateImpl>
    implements _$$LoadedFilePickerStateImplCopyWith<$Res> {
  __$$LoadedFilePickerStateImplCopyWithImpl(_$LoadedFilePickerStateImpl _value,
      $Res Function(_$LoadedFilePickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = freezed,
    Object? file = freezed,
  }) {
    return _then(_$LoadedFilePickerStateImpl(
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$LoadedFilePickerStateImpl implements LoadedFilePickerState {
  const _$LoadedFilePickerStateImpl(
      {required this.filePath, required this.file});

  @override
  final String? filePath;
  @override
  final File? file;

  @override
  String toString() {
    return 'FilePickerStates.loaded(filePath: $filePath, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedFilePickerStateImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, file);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedFilePickerStateImplCopyWith<_$LoadedFilePickerStateImpl>
      get copyWith => __$$LoadedFilePickerStateImplCopyWithImpl<
          _$LoadedFilePickerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? filePath, File? file) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(filePath, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? filePath, File? file)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(filePath, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? filePath, File? file)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(filePath, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFilePickerState value) initial,
    required TResult Function(LoadingFilePickerState value) loading,
    required TResult Function(LoadedFilePickerState value) loaded,
    required TResult Function(ErrorFilePickerState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFilePickerState value)? initial,
    TResult? Function(LoadingFilePickerState value)? loading,
    TResult? Function(LoadedFilePickerState value)? loaded,
    TResult? Function(ErrorFilePickerState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFilePickerState value)? initial,
    TResult Function(LoadingFilePickerState value)? loading,
    TResult Function(LoadedFilePickerState value)? loaded,
    TResult Function(ErrorFilePickerState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedFilePickerState implements FilePickerStates {
  const factory LoadedFilePickerState(
      {required final String? filePath,
      required final File? file}) = _$LoadedFilePickerStateImpl;

  String? get filePath;
  File? get file;

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedFilePickerStateImplCopyWith<_$LoadedFilePickerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorFilePickerStateImplCopyWith<$Res> {
  factory _$$ErrorFilePickerStateImplCopyWith(_$ErrorFilePickerStateImpl value,
          $Res Function(_$ErrorFilePickerStateImpl) then) =
      __$$ErrorFilePickerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorFilePickerStateImplCopyWithImpl<$Res>
    extends _$FilePickerStatesCopyWithImpl<$Res, _$ErrorFilePickerStateImpl>
    implements _$$ErrorFilePickerStateImplCopyWith<$Res> {
  __$$ErrorFilePickerStateImplCopyWithImpl(_$ErrorFilePickerStateImpl _value,
      $Res Function(_$ErrorFilePickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorFilePickerStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorFilePickerStateImpl implements ErrorFilePickerState {
  const _$ErrorFilePickerStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FilePickerStates.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorFilePickerStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorFilePickerStateImplCopyWith<_$ErrorFilePickerStateImpl>
      get copyWith =>
          __$$ErrorFilePickerStateImplCopyWithImpl<_$ErrorFilePickerStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? filePath, File? file) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? filePath, File? file)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? filePath, File? file)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFilePickerState value) initial,
    required TResult Function(LoadingFilePickerState value) loading,
    required TResult Function(LoadedFilePickerState value) loaded,
    required TResult Function(ErrorFilePickerState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFilePickerState value)? initial,
    TResult? Function(LoadingFilePickerState value)? loading,
    TResult? Function(LoadedFilePickerState value)? loaded,
    TResult? Function(ErrorFilePickerState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFilePickerState value)? initial,
    TResult Function(LoadingFilePickerState value)? loading,
    TResult Function(LoadedFilePickerState value)? loaded,
    TResult Function(ErrorFilePickerState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorFilePickerState implements FilePickerStates {
  const factory ErrorFilePickerState({required final String error}) =
      _$ErrorFilePickerStateImpl;

  String get error;

  /// Create a copy of FilePickerStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorFilePickerStateImplCopyWith<_$ErrorFilePickerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
