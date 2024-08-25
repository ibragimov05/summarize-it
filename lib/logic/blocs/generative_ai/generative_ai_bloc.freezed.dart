// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generative_ai_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenerativeAiEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)
        summarize,
    required TResult Function() toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult? Function()? toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SummarizeAiEvent value) summarize,
    required TResult Function(ToInitialGenerativeAiEvent value) toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummarizeAiEvent value)? summarize,
    TResult? Function(ToInitialGenerativeAiEvent value)? toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummarizeAiEvent value)? summarize,
    TResult Function(ToInitialGenerativeAiEvent value)? toInitial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerativeAiEventsCopyWith<$Res> {
  factory $GenerativeAiEventsCopyWith(
          GenerativeAiEvents value, $Res Function(GenerativeAiEvents) then) =
      _$GenerativeAiEventsCopyWithImpl<$Res, GenerativeAiEvents>;
}

/// @nodoc
class _$GenerativeAiEventsCopyWithImpl<$Res, $Val extends GenerativeAiEvents>
    implements $GenerativeAiEventsCopyWith<$Res> {
  _$GenerativeAiEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerativeAiEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SummarizeAiEventImplCopyWith<$Res> {
  factory _$$SummarizeAiEventImplCopyWith(_$SummarizeAiEventImpl value,
          $Res Function(_$SummarizeAiEventImpl) then) =
      __$$SummarizeAiEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Uint8List> files,
      SummaryLength summaryLength,
      SummaryLanguage summaryLanguage,
      RoundedLoadingButtonController buttonController});
}

/// @nodoc
class __$$SummarizeAiEventImplCopyWithImpl<$Res>
    extends _$GenerativeAiEventsCopyWithImpl<$Res, _$SummarizeAiEventImpl>
    implements _$$SummarizeAiEventImplCopyWith<$Res> {
  __$$SummarizeAiEventImplCopyWithImpl(_$SummarizeAiEventImpl _value,
      $Res Function(_$SummarizeAiEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
    Object? summaryLength = null,
    Object? summaryLanguage = null,
    Object? buttonController = null,
  }) {
    return _then(_$SummarizeAiEventImpl(
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      summaryLength: null == summaryLength
          ? _value.summaryLength
          : summaryLength // ignore: cast_nullable_to_non_nullable
              as SummaryLength,
      summaryLanguage: null == summaryLanguage
          ? _value.summaryLanguage
          : summaryLanguage // ignore: cast_nullable_to_non_nullable
              as SummaryLanguage,
      buttonController: null == buttonController
          ? _value.buttonController
          : buttonController // ignore: cast_nullable_to_non_nullable
              as RoundedLoadingButtonController,
    ));
  }
}

/// @nodoc

class _$SummarizeAiEventImpl
    with DiagnosticableTreeMixin
    implements SummarizeAiEvent {
  const _$SummarizeAiEventImpl(
      {required final List<Uint8List> files,
      required this.summaryLength,
      required this.summaryLanguage,
      required this.buttonController})
      : _files = files;

  final List<Uint8List> _files;
  @override
  List<Uint8List> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final SummaryLength summaryLength;
  @override
  final SummaryLanguage summaryLanguage;
  @override
  final RoundedLoadingButtonController buttonController;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiEvents.summarize(files: $files, summaryLength: $summaryLength, summaryLanguage: $summaryLanguage, buttonController: $buttonController)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerativeAiEvents.summarize'))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('summaryLength', summaryLength))
      ..add(DiagnosticsProperty('summaryLanguage', summaryLanguage))
      ..add(DiagnosticsProperty('buttonController', buttonController));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummarizeAiEventImpl &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.summaryLength, summaryLength) ||
                other.summaryLength == summaryLength) &&
            (identical(other.summaryLanguage, summaryLanguage) ||
                other.summaryLanguage == summaryLanguage) &&
            (identical(other.buttonController, buttonController) ||
                other.buttonController == buttonController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_files),
      summaryLength,
      summaryLanguage,
      buttonController);

  /// Create a copy of GenerativeAiEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummarizeAiEventImplCopyWith<_$SummarizeAiEventImpl> get copyWith =>
      __$$SummarizeAiEventImplCopyWithImpl<_$SummarizeAiEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)
        summarize,
    required TResult Function() toInitial,
  }) {
    return summarize(files, summaryLength, summaryLanguage, buttonController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult? Function()? toInitial,
  }) {
    return summarize?.call(
        files, summaryLength, summaryLanguage, buttonController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) {
    if (summarize != null) {
      return summarize(files, summaryLength, summaryLanguage, buttonController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SummarizeAiEvent value) summarize,
    required TResult Function(ToInitialGenerativeAiEvent value) toInitial,
  }) {
    return summarize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummarizeAiEvent value)? summarize,
    TResult? Function(ToInitialGenerativeAiEvent value)? toInitial,
  }) {
    return summarize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummarizeAiEvent value)? summarize,
    TResult Function(ToInitialGenerativeAiEvent value)? toInitial,
    required TResult orElse(),
  }) {
    if (summarize != null) {
      return summarize(this);
    }
    return orElse();
  }
}

abstract class SummarizeAiEvent implements GenerativeAiEvents {
  const factory SummarizeAiEvent(
          {required final List<Uint8List> files,
          required final SummaryLength summaryLength,
          required final SummaryLanguage summaryLanguage,
          required final RoundedLoadingButtonController buttonController}) =
      _$SummarizeAiEventImpl;

  List<Uint8List> get files;
  SummaryLength get summaryLength;
  SummaryLanguage get summaryLanguage;
  RoundedLoadingButtonController get buttonController;

  /// Create a copy of GenerativeAiEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummarizeAiEventImplCopyWith<_$SummarizeAiEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToInitialGenerativeAiEventImplCopyWith<$Res> {
  factory _$$ToInitialGenerativeAiEventImplCopyWith(
          _$ToInitialGenerativeAiEventImpl value,
          $Res Function(_$ToInitialGenerativeAiEventImpl) then) =
      __$$ToInitialGenerativeAiEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToInitialGenerativeAiEventImplCopyWithImpl<$Res>
    extends _$GenerativeAiEventsCopyWithImpl<$Res,
        _$ToInitialGenerativeAiEventImpl>
    implements _$$ToInitialGenerativeAiEventImplCopyWith<$Res> {
  __$$ToInitialGenerativeAiEventImplCopyWithImpl(
      _$ToInitialGenerativeAiEventImpl _value,
      $Res Function(_$ToInitialGenerativeAiEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToInitialGenerativeAiEventImpl
    with DiagnosticableTreeMixin
    implements ToInitialGenerativeAiEvent {
  const _$ToInitialGenerativeAiEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiEvents.toInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GenerativeAiEvents.toInitial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToInitialGenerativeAiEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)
        summarize,
    required TResult Function() toInitial,
  }) {
    return toInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult? Function()? toInitial,
  }) {
    return toInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Uint8List> files,
            SummaryLength summaryLength,
            SummaryLanguage summaryLanguage,
            RoundedLoadingButtonController buttonController)?
        summarize,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) {
    if (toInitial != null) {
      return toInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SummarizeAiEvent value) summarize,
    required TResult Function(ToInitialGenerativeAiEvent value) toInitial,
  }) {
    return toInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummarizeAiEvent value)? summarize,
    TResult? Function(ToInitialGenerativeAiEvent value)? toInitial,
  }) {
    return toInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummarizeAiEvent value)? summarize,
    TResult Function(ToInitialGenerativeAiEvent value)? toInitial,
    required TResult orElse(),
  }) {
    if (toInitial != null) {
      return toInitial(this);
    }
    return orElse();
  }
}

abstract class ToInitialGenerativeAiEvent implements GenerativeAiEvents {
  const factory ToInitialGenerativeAiEvent() = _$ToInitialGenerativeAiEventImpl;
}

/// @nodoc
mixin _$GenerativeAiStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Book book) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Book book)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Book book)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGenerativeAiState value) initial,
    required TResult Function(LoadingGenerativeAiState value) loading,
    required TResult Function(LoadedGenerativeAiState value) loaded,
    required TResult Function(ErrorGenerativeAiState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialGenerativeAiState value)? initial,
    TResult? Function(LoadingGenerativeAiState value)? loading,
    TResult? Function(LoadedGenerativeAiState value)? loaded,
    TResult? Function(ErrorGenerativeAiState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGenerativeAiState value)? initial,
    TResult Function(LoadingGenerativeAiState value)? loading,
    TResult Function(LoadedGenerativeAiState value)? loaded,
    TResult Function(ErrorGenerativeAiState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerativeAiStatesCopyWith<$Res> {
  factory $GenerativeAiStatesCopyWith(
          GenerativeAiStates value, $Res Function(GenerativeAiStates) then) =
      _$GenerativeAiStatesCopyWithImpl<$Res, GenerativeAiStates>;
}

/// @nodoc
class _$GenerativeAiStatesCopyWithImpl<$Res, $Val extends GenerativeAiStates>
    implements $GenerativeAiStatesCopyWith<$Res> {
  _$GenerativeAiStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialGenerativeAiStateImplCopyWith<$Res> {
  factory _$$InitialGenerativeAiStateImplCopyWith(
          _$InitialGenerativeAiStateImpl value,
          $Res Function(_$InitialGenerativeAiStateImpl) then) =
      __$$InitialGenerativeAiStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialGenerativeAiStateImplCopyWithImpl<$Res>
    extends _$GenerativeAiStatesCopyWithImpl<$Res,
        _$InitialGenerativeAiStateImpl>
    implements _$$InitialGenerativeAiStateImplCopyWith<$Res> {
  __$$InitialGenerativeAiStateImplCopyWithImpl(
      _$InitialGenerativeAiStateImpl _value,
      $Res Function(_$InitialGenerativeAiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialGenerativeAiStateImpl
    with DiagnosticableTreeMixin
    implements InitialGenerativeAiState {
  const _$InitialGenerativeAiStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiStates.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GenerativeAiStates.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialGenerativeAiStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Book book) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Book book)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Book book)? loaded,
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
    required TResult Function(InitialGenerativeAiState value) initial,
    required TResult Function(LoadingGenerativeAiState value) loading,
    required TResult Function(LoadedGenerativeAiState value) loaded,
    required TResult Function(ErrorGenerativeAiState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialGenerativeAiState value)? initial,
    TResult? Function(LoadingGenerativeAiState value)? loading,
    TResult? Function(LoadedGenerativeAiState value)? loaded,
    TResult? Function(ErrorGenerativeAiState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGenerativeAiState value)? initial,
    TResult Function(LoadingGenerativeAiState value)? loading,
    TResult Function(LoadedGenerativeAiState value)? loaded,
    TResult Function(ErrorGenerativeAiState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialGenerativeAiState implements GenerativeAiStates {
  const factory InitialGenerativeAiState() = _$InitialGenerativeAiStateImpl;
}

/// @nodoc
abstract class _$$LoadingGenerativeAiStateImplCopyWith<$Res> {
  factory _$$LoadingGenerativeAiStateImplCopyWith(
          _$LoadingGenerativeAiStateImpl value,
          $Res Function(_$LoadingGenerativeAiStateImpl) then) =
      __$$LoadingGenerativeAiStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGenerativeAiStateImplCopyWithImpl<$Res>
    extends _$GenerativeAiStatesCopyWithImpl<$Res,
        _$LoadingGenerativeAiStateImpl>
    implements _$$LoadingGenerativeAiStateImplCopyWith<$Res> {
  __$$LoadingGenerativeAiStateImplCopyWithImpl(
      _$LoadingGenerativeAiStateImpl _value,
      $Res Function(_$LoadingGenerativeAiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingGenerativeAiStateImpl
    with DiagnosticableTreeMixin
    implements LoadingGenerativeAiState {
  const _$LoadingGenerativeAiStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiStates.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GenerativeAiStates.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingGenerativeAiStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Book book) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Book book)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Book book)? loaded,
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
    required TResult Function(InitialGenerativeAiState value) initial,
    required TResult Function(LoadingGenerativeAiState value) loading,
    required TResult Function(LoadedGenerativeAiState value) loaded,
    required TResult Function(ErrorGenerativeAiState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialGenerativeAiState value)? initial,
    TResult? Function(LoadingGenerativeAiState value)? loading,
    TResult? Function(LoadedGenerativeAiState value)? loaded,
    TResult? Function(ErrorGenerativeAiState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGenerativeAiState value)? initial,
    TResult Function(LoadingGenerativeAiState value)? loading,
    TResult Function(LoadedGenerativeAiState value)? loaded,
    TResult Function(ErrorGenerativeAiState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingGenerativeAiState implements GenerativeAiStates {
  const factory LoadingGenerativeAiState() = _$LoadingGenerativeAiStateImpl;
}

/// @nodoc
abstract class _$$LoadedGenerativeAiStateImplCopyWith<$Res> {
  factory _$$LoadedGenerativeAiStateImplCopyWith(
          _$LoadedGenerativeAiStateImpl value,
          $Res Function(_$LoadedGenerativeAiStateImpl) then) =
      __$$LoadedGenerativeAiStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$LoadedGenerativeAiStateImplCopyWithImpl<$Res>
    extends _$GenerativeAiStatesCopyWithImpl<$Res,
        _$LoadedGenerativeAiStateImpl>
    implements _$$LoadedGenerativeAiStateImplCopyWith<$Res> {
  __$$LoadedGenerativeAiStateImplCopyWithImpl(
      _$LoadedGenerativeAiStateImpl _value,
      $Res Function(_$LoadedGenerativeAiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$LoadedGenerativeAiStateImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$LoadedGenerativeAiStateImpl
    with DiagnosticableTreeMixin
    implements LoadedGenerativeAiState {
  const _$LoadedGenerativeAiStateImpl({required this.book});

  @override
  final Book book;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiStates.loaded(book: $book)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerativeAiStates.loaded'))
      ..add(DiagnosticsProperty('book', book));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedGenerativeAiStateImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedGenerativeAiStateImplCopyWith<_$LoadedGenerativeAiStateImpl>
      get copyWith => __$$LoadedGenerativeAiStateImplCopyWithImpl<
          _$LoadedGenerativeAiStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Book book) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Book book)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Book book)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGenerativeAiState value) initial,
    required TResult Function(LoadingGenerativeAiState value) loading,
    required TResult Function(LoadedGenerativeAiState value) loaded,
    required TResult Function(ErrorGenerativeAiState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialGenerativeAiState value)? initial,
    TResult? Function(LoadingGenerativeAiState value)? loading,
    TResult? Function(LoadedGenerativeAiState value)? loaded,
    TResult? Function(ErrorGenerativeAiState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGenerativeAiState value)? initial,
    TResult Function(LoadingGenerativeAiState value)? loading,
    TResult Function(LoadedGenerativeAiState value)? loaded,
    TResult Function(ErrorGenerativeAiState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedGenerativeAiState implements GenerativeAiStates {
  const factory LoadedGenerativeAiState({required final Book book}) =
      _$LoadedGenerativeAiStateImpl;

  Book get book;

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedGenerativeAiStateImplCopyWith<_$LoadedGenerativeAiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorGenerativeAiStateImplCopyWith<$Res> {
  factory _$$ErrorGenerativeAiStateImplCopyWith(
          _$ErrorGenerativeAiStateImpl value,
          $Res Function(_$ErrorGenerativeAiStateImpl) then) =
      __$$ErrorGenerativeAiStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorGenerativeAiStateImplCopyWithImpl<$Res>
    extends _$GenerativeAiStatesCopyWithImpl<$Res, _$ErrorGenerativeAiStateImpl>
    implements _$$ErrorGenerativeAiStateImplCopyWith<$Res> {
  __$$ErrorGenerativeAiStateImplCopyWithImpl(
      _$ErrorGenerativeAiStateImpl _value,
      $Res Function(_$ErrorGenerativeAiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorGenerativeAiStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorGenerativeAiStateImpl
    with DiagnosticableTreeMixin
    implements ErrorGenerativeAiState {
  const _$ErrorGenerativeAiStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerativeAiStates.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerativeAiStates.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorGenerativeAiStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorGenerativeAiStateImplCopyWith<_$ErrorGenerativeAiStateImpl>
      get copyWith => __$$ErrorGenerativeAiStateImplCopyWithImpl<
          _$ErrorGenerativeAiStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Book book) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Book book)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Book book)? loaded,
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
    required TResult Function(InitialGenerativeAiState value) initial,
    required TResult Function(LoadingGenerativeAiState value) loading,
    required TResult Function(LoadedGenerativeAiState value) loaded,
    required TResult Function(ErrorGenerativeAiState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialGenerativeAiState value)? initial,
    TResult? Function(LoadingGenerativeAiState value)? loading,
    TResult? Function(LoadedGenerativeAiState value)? loaded,
    TResult? Function(ErrorGenerativeAiState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGenerativeAiState value)? initial,
    TResult Function(LoadingGenerativeAiState value)? loading,
    TResult Function(LoadedGenerativeAiState value)? loaded,
    TResult Function(ErrorGenerativeAiState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorGenerativeAiState implements GenerativeAiStates {
  const factory ErrorGenerativeAiState({required final String message}) =
      _$ErrorGenerativeAiStateImpl;

  String get message;

  /// Create a copy of GenerativeAiStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorGenerativeAiStateImplCopyWith<_$ErrorGenerativeAiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
