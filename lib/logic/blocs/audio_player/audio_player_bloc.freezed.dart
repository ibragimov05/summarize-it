// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioPlayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String summary, String summaryLanguage) download,
    required TResult Function(String audioUrl) play,
    required TResult Function() pause,
    required TResult Function() dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String summary, String summaryLanguage)? download,
    TResult? Function(String audioUrl)? play,
    TResult? Function()? pause,
    TResult? Function()? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String summary, String summaryLanguage)? download,
    TResult Function(String audioUrl)? play,
    TResult Function()? pause,
    TResult Function()? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadAudioEvent value) download,
    required TResult Function(PlayAudioEvent value) play,
    required TResult Function(PauseAudioEvent value) pause,
    required TResult Function(DisposeAudioEvent value) dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadAudioEvent value)? download,
    TResult? Function(PlayAudioEvent value)? play,
    TResult? Function(PauseAudioEvent value)? pause,
    TResult? Function(DisposeAudioEvent value)? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadAudioEvent value)? download,
    TResult Function(PlayAudioEvent value)? play,
    TResult Function(PauseAudioEvent value)? pause,
    TResult Function(DisposeAudioEvent value)? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerEventCopyWith<$Res> {
  factory $AudioPlayerEventCopyWith(
          AudioPlayerEvent value, $Res Function(AudioPlayerEvent) then) =
      _$AudioPlayerEventCopyWithImpl<$Res, AudioPlayerEvent>;
}

/// @nodoc
class _$AudioPlayerEventCopyWithImpl<$Res, $Val extends AudioPlayerEvent>
    implements $AudioPlayerEventCopyWith<$Res> {
  _$AudioPlayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DownloadAudioEventImplCopyWith<$Res> {
  factory _$$DownloadAudioEventImplCopyWith(_$DownloadAudioEventImpl value,
          $Res Function(_$DownloadAudioEventImpl) then) =
      __$$DownloadAudioEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String summary, String summaryLanguage});
}

/// @nodoc
class __$$DownloadAudioEventImplCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$DownloadAudioEventImpl>
    implements _$$DownloadAudioEventImplCopyWith<$Res> {
  __$$DownloadAudioEventImplCopyWithImpl(_$DownloadAudioEventImpl _value,
      $Res Function(_$DownloadAudioEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? summaryLanguage = null,
  }) {
    return _then(_$DownloadAudioEventImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      summaryLanguage: null == summaryLanguage
          ? _value.summaryLanguage
          : summaryLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadAudioEventImpl implements DownloadAudioEvent {
  const _$DownloadAudioEventImpl(
      {required this.summary, required this.summaryLanguage});

  @override
  final String summary;
  @override
  final String summaryLanguage;

  @override
  String toString() {
    return 'AudioPlayerEvent.download(summary: $summary, summaryLanguage: $summaryLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadAudioEventImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryLanguage, summaryLanguage) ||
                other.summaryLanguage == summaryLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary, summaryLanguage);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadAudioEventImplCopyWith<_$DownloadAudioEventImpl> get copyWith =>
      __$$DownloadAudioEventImplCopyWithImpl<_$DownloadAudioEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String summary, String summaryLanguage) download,
    required TResult Function(String audioUrl) play,
    required TResult Function() pause,
    required TResult Function() dispose,
  }) {
    return download(summary, summaryLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String summary, String summaryLanguage)? download,
    TResult? Function(String audioUrl)? play,
    TResult? Function()? pause,
    TResult? Function()? dispose,
  }) {
    return download?.call(summary, summaryLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String summary, String summaryLanguage)? download,
    TResult Function(String audioUrl)? play,
    TResult Function()? pause,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(summary, summaryLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadAudioEvent value) download,
    required TResult Function(PlayAudioEvent value) play,
    required TResult Function(PauseAudioEvent value) pause,
    required TResult Function(DisposeAudioEvent value) dispose,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadAudioEvent value)? download,
    TResult? Function(PlayAudioEvent value)? play,
    TResult? Function(PauseAudioEvent value)? pause,
    TResult? Function(DisposeAudioEvent value)? dispose,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadAudioEvent value)? download,
    TResult Function(PlayAudioEvent value)? play,
    TResult Function(PauseAudioEvent value)? pause,
    TResult Function(DisposeAudioEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class DownloadAudioEvent implements AudioPlayerEvent {
  const factory DownloadAudioEvent(
      {required final String summary,
      required final String summaryLanguage}) = _$DownloadAudioEventImpl;

  String get summary;
  String get summaryLanguage;

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadAudioEventImplCopyWith<_$DownloadAudioEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayAudioEventImplCopyWith<$Res> {
  factory _$$PlayAudioEventImplCopyWith(_$PlayAudioEventImpl value,
          $Res Function(_$PlayAudioEventImpl) then) =
      __$$PlayAudioEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioUrl});
}

/// @nodoc
class __$$PlayAudioEventImplCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$PlayAudioEventImpl>
    implements _$$PlayAudioEventImplCopyWith<$Res> {
  __$$PlayAudioEventImplCopyWithImpl(
      _$PlayAudioEventImpl _value, $Res Function(_$PlayAudioEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioUrl = null,
  }) {
    return _then(_$PlayAudioEventImpl(
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayAudioEventImpl implements PlayAudioEvent {
  const _$PlayAudioEventImpl({required this.audioUrl});

  @override
  final String audioUrl;

  @override
  String toString() {
    return 'AudioPlayerEvent.play(audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayAudioEventImpl &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioUrl);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayAudioEventImplCopyWith<_$PlayAudioEventImpl> get copyWith =>
      __$$PlayAudioEventImplCopyWithImpl<_$PlayAudioEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String summary, String summaryLanguage) download,
    required TResult Function(String audioUrl) play,
    required TResult Function() pause,
    required TResult Function() dispose,
  }) {
    return play(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String summary, String summaryLanguage)? download,
    TResult? Function(String audioUrl)? play,
    TResult? Function()? pause,
    TResult? Function()? dispose,
  }) {
    return play?.call(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String summary, String summaryLanguage)? download,
    TResult Function(String audioUrl)? play,
    TResult Function()? pause,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(audioUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadAudioEvent value) download,
    required TResult Function(PlayAudioEvent value) play,
    required TResult Function(PauseAudioEvent value) pause,
    required TResult Function(DisposeAudioEvent value) dispose,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadAudioEvent value)? download,
    TResult? Function(PlayAudioEvent value)? play,
    TResult? Function(PauseAudioEvent value)? pause,
    TResult? Function(DisposeAudioEvent value)? dispose,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadAudioEvent value)? download,
    TResult Function(PlayAudioEvent value)? play,
    TResult Function(PauseAudioEvent value)? pause,
    TResult Function(DisposeAudioEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(this);
    }
    return orElse();
  }
}

abstract class PlayAudioEvent implements AudioPlayerEvent {
  const factory PlayAudioEvent({required final String audioUrl}) =
      _$PlayAudioEventImpl;

  String get audioUrl;

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayAudioEventImplCopyWith<_$PlayAudioEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseAudioEventImplCopyWith<$Res> {
  factory _$$PauseAudioEventImplCopyWith(_$PauseAudioEventImpl value,
          $Res Function(_$PauseAudioEventImpl) then) =
      __$$PauseAudioEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseAudioEventImplCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$PauseAudioEventImpl>
    implements _$$PauseAudioEventImplCopyWith<$Res> {
  __$$PauseAudioEventImplCopyWithImpl(
      _$PauseAudioEventImpl _value, $Res Function(_$PauseAudioEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseAudioEventImpl implements PauseAudioEvent {
  const _$PauseAudioEventImpl();

  @override
  String toString() {
    return 'AudioPlayerEvent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseAudioEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String summary, String summaryLanguage) download,
    required TResult Function(String audioUrl) play,
    required TResult Function() pause,
    required TResult Function() dispose,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String summary, String summaryLanguage)? download,
    TResult? Function(String audioUrl)? play,
    TResult? Function()? pause,
    TResult? Function()? dispose,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String summary, String summaryLanguage)? download,
    TResult Function(String audioUrl)? play,
    TResult Function()? pause,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadAudioEvent value) download,
    required TResult Function(PlayAudioEvent value) play,
    required TResult Function(PauseAudioEvent value) pause,
    required TResult Function(DisposeAudioEvent value) dispose,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadAudioEvent value)? download,
    TResult? Function(PlayAudioEvent value)? play,
    TResult? Function(PauseAudioEvent value)? pause,
    TResult? Function(DisposeAudioEvent value)? dispose,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadAudioEvent value)? download,
    TResult Function(PlayAudioEvent value)? play,
    TResult Function(PauseAudioEvent value)? pause,
    TResult Function(DisposeAudioEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class PauseAudioEvent implements AudioPlayerEvent {
  const factory PauseAudioEvent() = _$PauseAudioEventImpl;
}

/// @nodoc
abstract class _$$DisposeAudioEventImplCopyWith<$Res> {
  factory _$$DisposeAudioEventImplCopyWith(_$DisposeAudioEventImpl value,
          $Res Function(_$DisposeAudioEventImpl) then) =
      __$$DisposeAudioEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeAudioEventImplCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$DisposeAudioEventImpl>
    implements _$$DisposeAudioEventImplCopyWith<$Res> {
  __$$DisposeAudioEventImplCopyWithImpl(_$DisposeAudioEventImpl _value,
      $Res Function(_$DisposeAudioEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisposeAudioEventImpl implements DisposeAudioEvent {
  const _$DisposeAudioEventImpl();

  @override
  String toString() {
    return 'AudioPlayerEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeAudioEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String summary, String summaryLanguage) download,
    required TResult Function(String audioUrl) play,
    required TResult Function() pause,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String summary, String summaryLanguage)? download,
    TResult? Function(String audioUrl)? play,
    TResult? Function()? pause,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String summary, String summaryLanguage)? download,
    TResult Function(String audioUrl)? play,
    TResult Function()? pause,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadAudioEvent value) download,
    required TResult Function(PlayAudioEvent value) play,
    required TResult Function(PauseAudioEvent value) pause,
    required TResult Function(DisposeAudioEvent value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadAudioEvent value)? download,
    TResult? Function(PlayAudioEvent value)? play,
    TResult? Function(PauseAudioEvent value)? pause,
    TResult? Function(DisposeAudioEvent value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadAudioEvent value)? download,
    TResult Function(PlayAudioEvent value)? play,
    TResult Function(PauseAudioEvent value)? pause,
    TResult Function(DisposeAudioEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class DisposeAudioEvent implements AudioPlayerEvent {
  const factory DisposeAudioEvent() = _$DisposeAudioEventImpl;
}

/// @nodoc
mixin _$AudioPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialAudioPlayerStateImplCopyWith<$Res> {
  factory _$$InitialAudioPlayerStateImplCopyWith(
          _$InitialAudioPlayerStateImpl value,
          $Res Function(_$InitialAudioPlayerStateImpl) then) =
      __$$InitialAudioPlayerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialAudioPlayerStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$InitialAudioPlayerStateImpl>
    implements _$$InitialAudioPlayerStateImplCopyWith<$Res> {
  __$$InitialAudioPlayerStateImplCopyWithImpl(
      _$InitialAudioPlayerStateImpl _value,
      $Res Function(_$InitialAudioPlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialAudioPlayerStateImpl implements InitialAudioPlayerState {
  const _$InitialAudioPlayerStateImpl();

  @override
  String toString() {
    return 'AudioPlayerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAudioPlayerStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
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
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAudioPlayerState implements AudioPlayerState {
  const factory InitialAudioPlayerState() = _$InitialAudioPlayerStateImpl;
}

/// @nodoc
abstract class _$$LoadingAudioPlayerStateImplCopyWith<$Res> {
  factory _$$LoadingAudioPlayerStateImplCopyWith(
          _$LoadingAudioPlayerStateImpl value,
          $Res Function(_$LoadingAudioPlayerStateImpl) then) =
      __$$LoadingAudioPlayerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAudioPlayerStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$LoadingAudioPlayerStateImpl>
    implements _$$LoadingAudioPlayerStateImplCopyWith<$Res> {
  __$$LoadingAudioPlayerStateImplCopyWithImpl(
      _$LoadingAudioPlayerStateImpl _value,
      $Res Function(_$LoadingAudioPlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingAudioPlayerStateImpl implements LoadingAudioPlayerState {
  const _$LoadingAudioPlayerStateImpl();

  @override
  String toString() {
    return 'AudioPlayerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingAudioPlayerStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
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
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingAudioPlayerState implements AudioPlayerState {
  const factory LoadingAudioPlayerState() = _$LoadingAudioPlayerStateImpl;
}

/// @nodoc
abstract class _$$LoadedAudioPlayerStateImplCopyWith<$Res> {
  factory _$$LoadedAudioPlayerStateImplCopyWith(
          _$LoadedAudioPlayerStateImpl value,
          $Res Function(_$LoadedAudioPlayerStateImpl) then) =
      __$$LoadedAudioPlayerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioUrl});
}

/// @nodoc
class __$$LoadedAudioPlayerStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$LoadedAudioPlayerStateImpl>
    implements _$$LoadedAudioPlayerStateImplCopyWith<$Res> {
  __$$LoadedAudioPlayerStateImplCopyWithImpl(
      _$LoadedAudioPlayerStateImpl _value,
      $Res Function(_$LoadedAudioPlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioUrl = null,
  }) {
    return _then(_$LoadedAudioPlayerStateImpl(
      null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedAudioPlayerStateImpl implements LoadedAudioPlayerState {
  const _$LoadedAudioPlayerStateImpl(this.audioUrl);

  @override
  final String audioUrl;

  @override
  String toString() {
    return 'AudioPlayerState.loaded(audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedAudioPlayerStateImpl &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioUrl);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedAudioPlayerStateImplCopyWith<_$LoadedAudioPlayerStateImpl>
      get copyWith => __$$LoadedAudioPlayerStateImplCopyWithImpl<
          _$LoadedAudioPlayerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return loaded(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(audioUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedAudioPlayerState implements AudioPlayerState {
  const factory LoadedAudioPlayerState(final String audioUrl) =
      _$LoadedAudioPlayerStateImpl;

  String get audioUrl;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedAudioPlayerStateImplCopyWith<_$LoadedAudioPlayerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayingAudioStateImplCopyWith<$Res> {
  factory _$$PlayingAudioStateImplCopyWith(_$PlayingAudioStateImpl value,
          $Res Function(_$PlayingAudioStateImpl) then) =
      __$$PlayingAudioStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioUrl});
}

/// @nodoc
class __$$PlayingAudioStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$PlayingAudioStateImpl>
    implements _$$PlayingAudioStateImplCopyWith<$Res> {
  __$$PlayingAudioStateImplCopyWithImpl(_$PlayingAudioStateImpl _value,
      $Res Function(_$PlayingAudioStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioUrl = null,
  }) {
    return _then(_$PlayingAudioStateImpl(
      null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayingAudioStateImpl implements PlayingAudioState {
  const _$PlayingAudioStateImpl(this.audioUrl);

  @override
  final String audioUrl;

  @override
  String toString() {
    return 'AudioPlayerState.playing(audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayingAudioStateImpl &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioUrl);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayingAudioStateImplCopyWith<_$PlayingAudioStateImpl> get copyWith =>
      __$$PlayingAudioStateImplCopyWithImpl<_$PlayingAudioStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return playing(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return playing?.call(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(audioUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class PlayingAudioState implements AudioPlayerState {
  const factory PlayingAudioState(final String audioUrl) =
      _$PlayingAudioStateImpl;

  String get audioUrl;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayingAudioStateImplCopyWith<_$PlayingAudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedAudioStateImplCopyWith<$Res> {
  factory _$$PausedAudioStateImplCopyWith(_$PausedAudioStateImpl value,
          $Res Function(_$PausedAudioStateImpl) then) =
      __$$PausedAudioStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioUrl});
}

/// @nodoc
class __$$PausedAudioStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$PausedAudioStateImpl>
    implements _$$PausedAudioStateImplCopyWith<$Res> {
  __$$PausedAudioStateImplCopyWithImpl(_$PausedAudioStateImpl _value,
      $Res Function(_$PausedAudioStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioUrl = null,
  }) {
    return _then(_$PausedAudioStateImpl(
      null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PausedAudioStateImpl implements PausedAudioState {
  const _$PausedAudioStateImpl(this.audioUrl);

  @override
  final String audioUrl;

  @override
  String toString() {
    return 'AudioPlayerState.paused(audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedAudioStateImpl &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioUrl);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PausedAudioStateImplCopyWith<_$PausedAudioStateImpl> get copyWith =>
      __$$PausedAudioStateImplCopyWithImpl<_$PausedAudioStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return paused(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return paused?.call(audioUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(audioUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class PausedAudioState implements AudioPlayerState {
  const factory PausedAudioState(final String audioUrl) =
      _$PausedAudioStateImpl;

  String get audioUrl;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PausedAudioStateImplCopyWith<_$PausedAudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorAudioPlayerStateImplCopyWith<$Res> {
  factory _$$ErrorAudioPlayerStateImplCopyWith(
          _$ErrorAudioPlayerStateImpl value,
          $Res Function(_$ErrorAudioPlayerStateImpl) then) =
      __$$ErrorAudioPlayerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorAudioPlayerStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$ErrorAudioPlayerStateImpl>
    implements _$$ErrorAudioPlayerStateImplCopyWith<$Res> {
  __$$ErrorAudioPlayerStateImplCopyWithImpl(_$ErrorAudioPlayerStateImpl _value,
      $Res Function(_$ErrorAudioPlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorAudioPlayerStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorAudioPlayerStateImpl implements ErrorAudioPlayerState {
  const _$ErrorAudioPlayerStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AudioPlayerState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAudioPlayerStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAudioPlayerStateImplCopyWith<_$ErrorAudioPlayerStateImpl>
      get copyWith => __$$ErrorAudioPlayerStateImplCopyWithImpl<
          _$ErrorAudioPlayerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String audioUrl) loaded,
    required TResult Function(String audioUrl) playing,
    required TResult Function(String audioUrl) paused,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String audioUrl)? loaded,
    TResult? Function(String audioUrl)? playing,
    TResult? Function(String audioUrl)? paused,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String audioUrl)? loaded,
    TResult Function(String audioUrl)? playing,
    TResult Function(String audioUrl)? paused,
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
    required TResult Function(InitialAudioPlayerState value) initial,
    required TResult Function(LoadingAudioPlayerState value) loading,
    required TResult Function(LoadedAudioPlayerState value) loaded,
    required TResult Function(PlayingAudioState value) playing,
    required TResult Function(PausedAudioState value) paused,
    required TResult Function(ErrorAudioPlayerState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudioPlayerState value)? initial,
    TResult? Function(LoadingAudioPlayerState value)? loading,
    TResult? Function(LoadedAudioPlayerState value)? loaded,
    TResult? Function(PlayingAudioState value)? playing,
    TResult? Function(PausedAudioState value)? paused,
    TResult? Function(ErrorAudioPlayerState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudioPlayerState value)? initial,
    TResult Function(LoadingAudioPlayerState value)? loading,
    TResult Function(LoadedAudioPlayerState value)? loaded,
    TResult Function(PlayingAudioState value)? playing,
    TResult Function(PausedAudioState value)? paused,
    TResult Function(ErrorAudioPlayerState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAudioPlayerState implements AudioPlayerState {
  const factory ErrorAudioPlayerState(final String message) =
      _$ErrorAudioPlayerStateImpl;

  String get message;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorAudioPlayerStateImplCopyWith<_$ErrorAudioPlayerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
