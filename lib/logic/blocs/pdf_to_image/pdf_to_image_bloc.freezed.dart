// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_to_image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PdfToImageEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            File file, RoundedLoadingButtonController buttonController)
        convert,
    required TResult Function() toInitialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult? Function()? toInitialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult Function()? toInitialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConvertPdfToImageEvent value) convert,
    required TResult Function(ToInitialStatePdfToImageEvent value)
        toInitialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConvertPdfToImageEvent value)? convert,
    TResult? Function(ToInitialStatePdfToImageEvent value)? toInitialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConvertPdfToImageEvent value)? convert,
    TResult Function(ToInitialStatePdfToImageEvent value)? toInitialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfToImageEventsCopyWith<$Res> {
  factory $PdfToImageEventsCopyWith(
          PdfToImageEvents value, $Res Function(PdfToImageEvents) then) =
      _$PdfToImageEventsCopyWithImpl<$Res, PdfToImageEvents>;
}

/// @nodoc
class _$PdfToImageEventsCopyWithImpl<$Res, $Val extends PdfToImageEvents>
    implements $PdfToImageEventsCopyWith<$Res> {
  _$PdfToImageEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfToImageEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConvertPdfToImageEventImplCopyWith<$Res> {
  factory _$$ConvertPdfToImageEventImplCopyWith(
          _$ConvertPdfToImageEventImpl value,
          $Res Function(_$ConvertPdfToImageEventImpl) then) =
      __$$ConvertPdfToImageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file, RoundedLoadingButtonController buttonController});
}

/// @nodoc
class __$$ConvertPdfToImageEventImplCopyWithImpl<$Res>
    extends _$PdfToImageEventsCopyWithImpl<$Res, _$ConvertPdfToImageEventImpl>
    implements _$$ConvertPdfToImageEventImplCopyWith<$Res> {
  __$$ConvertPdfToImageEventImplCopyWithImpl(
      _$ConvertPdfToImageEventImpl _value,
      $Res Function(_$ConvertPdfToImageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? buttonController = null,
  }) {
    return _then(_$ConvertPdfToImageEventImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      buttonController: null == buttonController
          ? _value.buttonController
          : buttonController // ignore: cast_nullable_to_non_nullable
              as RoundedLoadingButtonController,
    ));
  }
}

/// @nodoc

class _$ConvertPdfToImageEventImpl implements ConvertPdfToImageEvent {
  const _$ConvertPdfToImageEventImpl(
      {required this.file, required this.buttonController});

  @override
  final File file;
  @override
  final RoundedLoadingButtonController buttonController;

  @override
  String toString() {
    return 'PdfToImageEvents.convert(file: $file, buttonController: $buttonController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertPdfToImageEventImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.buttonController, buttonController) ||
                other.buttonController == buttonController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, buttonController);

  /// Create a copy of PdfToImageEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertPdfToImageEventImplCopyWith<_$ConvertPdfToImageEventImpl>
      get copyWith => __$$ConvertPdfToImageEventImplCopyWithImpl<
          _$ConvertPdfToImageEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            File file, RoundedLoadingButtonController buttonController)
        convert,
    required TResult Function() toInitialState,
  }) {
    return convert(file, buttonController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult? Function()? toInitialState,
  }) {
    return convert?.call(file, buttonController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult Function()? toInitialState,
    required TResult orElse(),
  }) {
    if (convert != null) {
      return convert(file, buttonController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConvertPdfToImageEvent value) convert,
    required TResult Function(ToInitialStatePdfToImageEvent value)
        toInitialState,
  }) {
    return convert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConvertPdfToImageEvent value)? convert,
    TResult? Function(ToInitialStatePdfToImageEvent value)? toInitialState,
  }) {
    return convert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConvertPdfToImageEvent value)? convert,
    TResult Function(ToInitialStatePdfToImageEvent value)? toInitialState,
    required TResult orElse(),
  }) {
    if (convert != null) {
      return convert(this);
    }
    return orElse();
  }
}

abstract class ConvertPdfToImageEvent implements PdfToImageEvents {
  const factory ConvertPdfToImageEvent(
          {required final File file,
          required final RoundedLoadingButtonController buttonController}) =
      _$ConvertPdfToImageEventImpl;

  File get file;
  RoundedLoadingButtonController get buttonController;

  /// Create a copy of PdfToImageEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConvertPdfToImageEventImplCopyWith<_$ConvertPdfToImageEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToInitialStatePdfToImageEventImplCopyWith<$Res> {
  factory _$$ToInitialStatePdfToImageEventImplCopyWith(
          _$ToInitialStatePdfToImageEventImpl value,
          $Res Function(_$ToInitialStatePdfToImageEventImpl) then) =
      __$$ToInitialStatePdfToImageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToInitialStatePdfToImageEventImplCopyWithImpl<$Res>
    extends _$PdfToImageEventsCopyWithImpl<$Res,
        _$ToInitialStatePdfToImageEventImpl>
    implements _$$ToInitialStatePdfToImageEventImplCopyWith<$Res> {
  __$$ToInitialStatePdfToImageEventImplCopyWithImpl(
      _$ToInitialStatePdfToImageEventImpl _value,
      $Res Function(_$ToInitialStatePdfToImageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToInitialStatePdfToImageEventImpl
    implements ToInitialStatePdfToImageEvent {
  const _$ToInitialStatePdfToImageEventImpl();

  @override
  String toString() {
    return 'PdfToImageEvents.toInitialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToInitialStatePdfToImageEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            File file, RoundedLoadingButtonController buttonController)
        convert,
    required TResult Function() toInitialState,
  }) {
    return toInitialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult? Function()? toInitialState,
  }) {
    return toInitialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            File file, RoundedLoadingButtonController buttonController)?
        convert,
    TResult Function()? toInitialState,
    required TResult orElse(),
  }) {
    if (toInitialState != null) {
      return toInitialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConvertPdfToImageEvent value) convert,
    required TResult Function(ToInitialStatePdfToImageEvent value)
        toInitialState,
  }) {
    return toInitialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConvertPdfToImageEvent value)? convert,
    TResult? Function(ToInitialStatePdfToImageEvent value)? toInitialState,
  }) {
    return toInitialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConvertPdfToImageEvent value)? convert,
    TResult Function(ToInitialStatePdfToImageEvent value)? toInitialState,
    required TResult orElse(),
  }) {
    if (toInitialState != null) {
      return toInitialState(this);
    }
    return orElse();
  }
}

abstract class ToInitialStatePdfToImageEvent implements PdfToImageEvents {
  const factory ToInitialStatePdfToImageEvent() =
      _$ToInitialStatePdfToImageEventImpl;
}

/// @nodoc
mixin _$PdfToImageStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Uint8List> files) loading,
    required TResult Function(List<Uint8List> files) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Uint8List> files)? loading,
    TResult? Function(List<Uint8List> files)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Uint8List> files)? loading,
    TResult Function(List<Uint8List> files)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPdfToImageState value) initial,
    required TResult Function(LoadingPdfToImageState value) loading,
    required TResult Function(LoadedPdfToImageState value) loaded,
    required TResult Function(ErrorPdfToImageState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialPdfToImageState value)? initial,
    TResult? Function(LoadingPdfToImageState value)? loading,
    TResult? Function(LoadedPdfToImageState value)? loaded,
    TResult? Function(ErrorPdfToImageState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPdfToImageState value)? initial,
    TResult Function(LoadingPdfToImageState value)? loading,
    TResult Function(LoadedPdfToImageState value)? loaded,
    TResult Function(ErrorPdfToImageState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfToImageStatesCopyWith<$Res> {
  factory $PdfToImageStatesCopyWith(
          PdfToImageStates value, $Res Function(PdfToImageStates) then) =
      _$PdfToImageStatesCopyWithImpl<$Res, PdfToImageStates>;
}

/// @nodoc
class _$PdfToImageStatesCopyWithImpl<$Res, $Val extends PdfToImageStates>
    implements $PdfToImageStatesCopyWith<$Res> {
  _$PdfToImageStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialPdfToImageStateImplCopyWith<$Res> {
  factory _$$InitialPdfToImageStateImplCopyWith(
          _$InitialPdfToImageStateImpl value,
          $Res Function(_$InitialPdfToImageStateImpl) then) =
      __$$InitialPdfToImageStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialPdfToImageStateImplCopyWithImpl<$Res>
    extends _$PdfToImageStatesCopyWithImpl<$Res, _$InitialPdfToImageStateImpl>
    implements _$$InitialPdfToImageStateImplCopyWith<$Res> {
  __$$InitialPdfToImageStateImplCopyWithImpl(
      _$InitialPdfToImageStateImpl _value,
      $Res Function(_$InitialPdfToImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialPdfToImageStateImpl implements InitialPdfToImageState {
  const _$InitialPdfToImageStateImpl();

  @override
  String toString() {
    return 'PdfToImageStates.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialPdfToImageStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Uint8List> files) loading,
    required TResult Function(List<Uint8List> files) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Uint8List> files)? loading,
    TResult? Function(List<Uint8List> files)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Uint8List> files)? loading,
    TResult Function(List<Uint8List> files)? loaded,
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
    required TResult Function(InitialPdfToImageState value) initial,
    required TResult Function(LoadingPdfToImageState value) loading,
    required TResult Function(LoadedPdfToImageState value) loaded,
    required TResult Function(ErrorPdfToImageState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialPdfToImageState value)? initial,
    TResult? Function(LoadingPdfToImageState value)? loading,
    TResult? Function(LoadedPdfToImageState value)? loaded,
    TResult? Function(ErrorPdfToImageState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPdfToImageState value)? initial,
    TResult Function(LoadingPdfToImageState value)? loading,
    TResult Function(LoadedPdfToImageState value)? loaded,
    TResult Function(ErrorPdfToImageState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPdfToImageState implements PdfToImageStates {
  const factory InitialPdfToImageState() = _$InitialPdfToImageStateImpl;
}

/// @nodoc
abstract class _$$LoadingPdfToImageStateImplCopyWith<$Res> {
  factory _$$LoadingPdfToImageStateImplCopyWith(
          _$LoadingPdfToImageStateImpl value,
          $Res Function(_$LoadingPdfToImageStateImpl) then) =
      __$$LoadingPdfToImageStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Uint8List> files});
}

/// @nodoc
class __$$LoadingPdfToImageStateImplCopyWithImpl<$Res>
    extends _$PdfToImageStatesCopyWithImpl<$Res, _$LoadingPdfToImageStateImpl>
    implements _$$LoadingPdfToImageStateImplCopyWith<$Res> {
  __$$LoadingPdfToImageStateImplCopyWithImpl(
      _$LoadingPdfToImageStateImpl _value,
      $Res Function(_$LoadingPdfToImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_$LoadingPdfToImageStateImpl(
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
    ));
  }
}

/// @nodoc

class _$LoadingPdfToImageStateImpl implements LoadingPdfToImageState {
  const _$LoadingPdfToImageStateImpl({required final List<Uint8List> files})
      : _files = files;

  final List<Uint8List> _files;
  @override
  List<Uint8List> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'PdfToImageStates.loading(files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingPdfToImageStateImpl &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_files));

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingPdfToImageStateImplCopyWith<_$LoadingPdfToImageStateImpl>
      get copyWith => __$$LoadingPdfToImageStateImplCopyWithImpl<
          _$LoadingPdfToImageStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Uint8List> files) loading,
    required TResult Function(List<Uint8List> files) loaded,
    required TResult Function(String error) error,
  }) {
    return loading(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Uint8List> files)? loading,
    TResult? Function(List<Uint8List> files)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Uint8List> files)? loading,
    TResult Function(List<Uint8List> files)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPdfToImageState value) initial,
    required TResult Function(LoadingPdfToImageState value) loading,
    required TResult Function(LoadedPdfToImageState value) loaded,
    required TResult Function(ErrorPdfToImageState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialPdfToImageState value)? initial,
    TResult? Function(LoadingPdfToImageState value)? loading,
    TResult? Function(LoadedPdfToImageState value)? loaded,
    TResult? Function(ErrorPdfToImageState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPdfToImageState value)? initial,
    TResult Function(LoadingPdfToImageState value)? loading,
    TResult Function(LoadedPdfToImageState value)? loaded,
    TResult Function(ErrorPdfToImageState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingPdfToImageState implements PdfToImageStates {
  const factory LoadingPdfToImageState({required final List<Uint8List> files}) =
      _$LoadingPdfToImageStateImpl;

  List<Uint8List> get files;

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingPdfToImageStateImplCopyWith<_$LoadingPdfToImageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedPdfToImageStateImplCopyWith<$Res> {
  factory _$$LoadedPdfToImageStateImplCopyWith(
          _$LoadedPdfToImageStateImpl value,
          $Res Function(_$LoadedPdfToImageStateImpl) then) =
      __$$LoadedPdfToImageStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Uint8List> files});
}

/// @nodoc
class __$$LoadedPdfToImageStateImplCopyWithImpl<$Res>
    extends _$PdfToImageStatesCopyWithImpl<$Res, _$LoadedPdfToImageStateImpl>
    implements _$$LoadedPdfToImageStateImplCopyWith<$Res> {
  __$$LoadedPdfToImageStateImplCopyWithImpl(_$LoadedPdfToImageStateImpl _value,
      $Res Function(_$LoadedPdfToImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_$LoadedPdfToImageStateImpl(
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
    ));
  }
}

/// @nodoc

class _$LoadedPdfToImageStateImpl implements LoadedPdfToImageState {
  const _$LoadedPdfToImageStateImpl({required final List<Uint8List> files})
      : _files = files;

  final List<Uint8List> _files;
  @override
  List<Uint8List> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'PdfToImageStates.loaded(files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedPdfToImageStateImpl &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_files));

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedPdfToImageStateImplCopyWith<_$LoadedPdfToImageStateImpl>
      get copyWith => __$$LoadedPdfToImageStateImplCopyWithImpl<
          _$LoadedPdfToImageStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Uint8List> files) loading,
    required TResult Function(List<Uint8List> files) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Uint8List> files)? loading,
    TResult? Function(List<Uint8List> files)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Uint8List> files)? loading,
    TResult Function(List<Uint8List> files)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPdfToImageState value) initial,
    required TResult Function(LoadingPdfToImageState value) loading,
    required TResult Function(LoadedPdfToImageState value) loaded,
    required TResult Function(ErrorPdfToImageState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialPdfToImageState value)? initial,
    TResult? Function(LoadingPdfToImageState value)? loading,
    TResult? Function(LoadedPdfToImageState value)? loaded,
    TResult? Function(ErrorPdfToImageState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPdfToImageState value)? initial,
    TResult Function(LoadingPdfToImageState value)? loading,
    TResult Function(LoadedPdfToImageState value)? loaded,
    TResult Function(ErrorPdfToImageState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedPdfToImageState implements PdfToImageStates {
  const factory LoadedPdfToImageState({required final List<Uint8List> files}) =
      _$LoadedPdfToImageStateImpl;

  List<Uint8List> get files;

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedPdfToImageStateImplCopyWith<_$LoadedPdfToImageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorPdfToImageStateImplCopyWith<$Res> {
  factory _$$ErrorPdfToImageStateImplCopyWith(_$ErrorPdfToImageStateImpl value,
          $Res Function(_$ErrorPdfToImageStateImpl) then) =
      __$$ErrorPdfToImageStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorPdfToImageStateImplCopyWithImpl<$Res>
    extends _$PdfToImageStatesCopyWithImpl<$Res, _$ErrorPdfToImageStateImpl>
    implements _$$ErrorPdfToImageStateImplCopyWith<$Res> {
  __$$ErrorPdfToImageStateImplCopyWithImpl(_$ErrorPdfToImageStateImpl _value,
      $Res Function(_$ErrorPdfToImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorPdfToImageStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorPdfToImageStateImpl implements ErrorPdfToImageState {
  const _$ErrorPdfToImageStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'PdfToImageStates.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorPdfToImageStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorPdfToImageStateImplCopyWith<_$ErrorPdfToImageStateImpl>
      get copyWith =>
          __$$ErrorPdfToImageStateImplCopyWithImpl<_$ErrorPdfToImageStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Uint8List> files) loading,
    required TResult Function(List<Uint8List> files) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Uint8List> files)? loading,
    TResult? Function(List<Uint8List> files)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Uint8List> files)? loading,
    TResult Function(List<Uint8List> files)? loaded,
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
    required TResult Function(InitialPdfToImageState value) initial,
    required TResult Function(LoadingPdfToImageState value) loading,
    required TResult Function(LoadedPdfToImageState value) loaded,
    required TResult Function(ErrorPdfToImageState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialPdfToImageState value)? initial,
    TResult? Function(LoadingPdfToImageState value)? loading,
    TResult? Function(LoadedPdfToImageState value)? loaded,
    TResult? Function(ErrorPdfToImageState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPdfToImageState value)? initial,
    TResult Function(LoadingPdfToImageState value)? loading,
    TResult Function(LoadedPdfToImageState value)? loaded,
    TResult Function(ErrorPdfToImageState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPdfToImageState implements PdfToImageStates {
  const factory ErrorPdfToImageState({required final String error}) =
      _$ErrorPdfToImageStateImpl;

  String get error;

  /// Create a copy of PdfToImageStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorPdfToImageStateImplCopyWith<_$ErrorPdfToImageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
