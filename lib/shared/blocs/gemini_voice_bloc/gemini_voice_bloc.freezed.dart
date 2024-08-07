// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gemini_voice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeminiVoiceState {
  List<String>? get recognizedWords => throw _privateConstructorUsedError;
  GenieRespose<dynamic>? get response => throw _privateConstructorUsedError;
  bool get isLoadingAnswer => throw _privateConstructorUsedError;
  bool get showGenieWidget => throw _privateConstructorUsedError;
  bool get showSpokenWords => throw _privateConstructorUsedError;
  bool get isGeneratingAnswer => throw _privateConstructorUsedError;
  bool get isListening => throw _privateConstructorUsedError;
  bool get isReloading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeminiVoiceStateCopyWith<GeminiVoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeminiVoiceStateCopyWith<$Res> {
  factory $GeminiVoiceStateCopyWith(
          GeminiVoiceState value, $Res Function(GeminiVoiceState) then) =
      _$GeminiVoiceStateCopyWithImpl<$Res, GeminiVoiceState>;
  @useResult
  $Res call(
      {List<String>? recognizedWords,
      GenieRespose<dynamic>? response,
      bool isLoadingAnswer,
      bool showGenieWidget,
      bool showSpokenWords,
      bool isGeneratingAnswer,
      bool isListening,
      bool isReloading,
      String? errorMessage});

  $GenieResposeCopyWith<dynamic, $Res>? get response;
}

/// @nodoc
class _$GeminiVoiceStateCopyWithImpl<$Res, $Val extends GeminiVoiceState>
    implements $GeminiVoiceStateCopyWith<$Res> {
  _$GeminiVoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recognizedWords = freezed,
    Object? response = freezed,
    Object? isLoadingAnswer = null,
    Object? showGenieWidget = null,
    Object? showSpokenWords = null,
    Object? isGeneratingAnswer = null,
    Object? isListening = null,
    Object? isReloading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      recognizedWords: freezed == recognizedWords
          ? _value.recognizedWords
          : recognizedWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GenieRespose<dynamic>?,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showGenieWidget: null == showGenieWidget
          ? _value.showGenieWidget
          : showGenieWidget // ignore: cast_nullable_to_non_nullable
              as bool,
      showSpokenWords: null == showSpokenWords
          ? _value.showSpokenWords
          : showSpokenWords // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      isReloading: null == isReloading
          ? _value.isReloading
          : isReloading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenieResposeCopyWith<dynamic, $Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $GenieResposeCopyWith<dynamic, $Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeminiVoiceStateImplCopyWith<$Res>
    implements $GeminiVoiceStateCopyWith<$Res> {
  factory _$$GeminiVoiceStateImplCopyWith(_$GeminiVoiceStateImpl value,
          $Res Function(_$GeminiVoiceStateImpl) then) =
      __$$GeminiVoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? recognizedWords,
      GenieRespose<dynamic>? response,
      bool isLoadingAnswer,
      bool showGenieWidget,
      bool showSpokenWords,
      bool isGeneratingAnswer,
      bool isListening,
      bool isReloading,
      String? errorMessage});

  @override
  $GenieResposeCopyWith<dynamic, $Res>? get response;
}

/// @nodoc
class __$$GeminiVoiceStateImplCopyWithImpl<$Res>
    extends _$GeminiVoiceStateCopyWithImpl<$Res, _$GeminiVoiceStateImpl>
    implements _$$GeminiVoiceStateImplCopyWith<$Res> {
  __$$GeminiVoiceStateImplCopyWithImpl(_$GeminiVoiceStateImpl _value,
      $Res Function(_$GeminiVoiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recognizedWords = freezed,
    Object? response = freezed,
    Object? isLoadingAnswer = null,
    Object? showGenieWidget = null,
    Object? showSpokenWords = null,
    Object? isGeneratingAnswer = null,
    Object? isListening = null,
    Object? isReloading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$GeminiVoiceStateImpl(
      recognizedWords: freezed == recognizedWords
          ? _value._recognizedWords
          : recognizedWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GenieRespose<dynamic>?,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showGenieWidget: null == showGenieWidget
          ? _value.showGenieWidget
          : showGenieWidget // ignore: cast_nullable_to_non_nullable
              as bool,
      showSpokenWords: null == showSpokenWords
          ? _value.showSpokenWords
          : showSpokenWords // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      isReloading: null == isReloading
          ? _value.isReloading
          : isReloading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeminiVoiceStateImpl extends _GeminiVoiceState {
  const _$GeminiVoiceStateImpl(
      {final List<String>? recognizedWords,
      this.response,
      this.isLoadingAnswer = false,
      this.showGenieWidget = false,
      this.showSpokenWords = false,
      this.isGeneratingAnswer = false,
      this.isListening = false,
      this.isReloading = false,
      this.errorMessage})
      : _recognizedWords = recognizedWords,
        super._();

  final List<String>? _recognizedWords;
  @override
  List<String>? get recognizedWords {
    final value = _recognizedWords;
    if (value == null) return null;
    if (_recognizedWords is EqualUnmodifiableListView) return _recognizedWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final GenieRespose<dynamic>? response;
  @override
  @JsonKey()
  final bool isLoadingAnswer;
  @override
  @JsonKey()
  final bool showGenieWidget;
  @override
  @JsonKey()
  final bool showSpokenWords;
  @override
  @JsonKey()
  final bool isGeneratingAnswer;
  @override
  @JsonKey()
  final bool isListening;
  @override
  @JsonKey()
  final bool isReloading;
  @override
  final String? errorMessage;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeminiVoiceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recognizedWords, _recognizedWords) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.isLoadingAnswer, isLoadingAnswer) ||
                other.isLoadingAnswer == isLoadingAnswer) &&
            (identical(other.showGenieWidget, showGenieWidget) ||
                other.showGenieWidget == showGenieWidget) &&
            (identical(other.showSpokenWords, showSpokenWords) ||
                other.showSpokenWords == showSpokenWords) &&
            (identical(other.isGeneratingAnswer, isGeneratingAnswer) ||
                other.isGeneratingAnswer == isGeneratingAnswer) &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening) &&
            (identical(other.isReloading, isReloading) ||
                other.isReloading == isReloading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recognizedWords),
      response,
      isLoadingAnswer,
      showGenieWidget,
      showSpokenWords,
      isGeneratingAnswer,
      isListening,
      isReloading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeminiVoiceStateImplCopyWith<_$GeminiVoiceStateImpl> get copyWith =>
      __$$GeminiVoiceStateImplCopyWithImpl<_$GeminiVoiceStateImpl>(
          this, _$identity);
}

abstract class _GeminiVoiceState extends GeminiVoiceState {
  const factory _GeminiVoiceState(
      {final List<String>? recognizedWords,
      final GenieRespose<dynamic>? response,
      final bool isLoadingAnswer,
      final bool showGenieWidget,
      final bool showSpokenWords,
      final bool isGeneratingAnswer,
      final bool isListening,
      final bool isReloading,
      final String? errorMessage}) = _$GeminiVoiceStateImpl;
  const _GeminiVoiceState._() : super._();

  @override
  List<String>? get recognizedWords;
  @override
  GenieRespose<dynamic>? get response;
  @override
  bool get isLoadingAnswer;
  @override
  bool get showGenieWidget;
  @override
  bool get showSpokenWords;
  @override
  bool get isGeneratingAnswer;
  @override
  bool get isListening;
  @override
  bool get isReloading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$GeminiVoiceStateImplCopyWith<_$GeminiVoiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GenieRespose<T> {
  T? get data => throw _privateConstructorUsedError;
  String? get pushNamedRoute => throw _privateConstructorUsedError;
  String? get message =>
      throw _privateConstructorUsedError; // Map<String, Object?>? dataMap,
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenieResposeCopyWith<T, GenieRespose<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenieResposeCopyWith<T, $Res> {
  factory $GenieResposeCopyWith(
          GenieRespose<T> value, $Res Function(GenieRespose<T>) then) =
      _$GenieResposeCopyWithImpl<T, $Res, GenieRespose<T>>;
  @useResult
  $Res call(
      {T? data, String? pushNamedRoute, String? message, String? errorMessage});
}

/// @nodoc
class _$GenieResposeCopyWithImpl<T, $Res, $Val extends GenieRespose<T>>
    implements $GenieResposeCopyWith<T, $Res> {
  _$GenieResposeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pushNamedRoute = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      pushNamedRoute: freezed == pushNamedRoute
          ? _value.pushNamedRoute
          : pushNamedRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenieResposeImplCopyWith<T, $Res>
    implements $GenieResposeCopyWith<T, $Res> {
  factory _$$GenieResposeImplCopyWith(_$GenieResposeImpl<T> value,
          $Res Function(_$GenieResposeImpl<T>) then) =
      __$$GenieResposeImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T? data, String? pushNamedRoute, String? message, String? errorMessage});
}

/// @nodoc
class __$$GenieResposeImplCopyWithImpl<T, $Res>
    extends _$GenieResposeCopyWithImpl<T, $Res, _$GenieResposeImpl<T>>
    implements _$$GenieResposeImplCopyWith<T, $Res> {
  __$$GenieResposeImplCopyWithImpl(
      _$GenieResposeImpl<T> _value, $Res Function(_$GenieResposeImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pushNamedRoute = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$GenieResposeImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      pushNamedRoute: freezed == pushNamedRoute
          ? _value.pushNamedRoute
          : pushNamedRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GenieResposeImpl<T> implements _GenieRespose<T> {
  const _$GenieResposeImpl(
      {this.data, this.pushNamedRoute, this.message, this.errorMessage});

  @override
  final T? data;
  @override
  final String? pushNamedRoute;
  @override
  final String? message;
// Map<String, Object?>? dataMap,
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GenieRespose<$T>(data: $data, pushNamedRoute: $pushNamedRoute, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenieResposeImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.pushNamedRoute, pushNamedRoute) ||
                other.pushNamedRoute == pushNamedRoute) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      pushNamedRoute,
      message,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenieResposeImplCopyWith<T, _$GenieResposeImpl<T>> get copyWith =>
      __$$GenieResposeImplCopyWithImpl<T, _$GenieResposeImpl<T>>(
          this, _$identity);
}

abstract class _GenieRespose<T> implements GenieRespose<T> {
  const factory _GenieRespose(
      {final T? data,
      final String? pushNamedRoute,
      final String? message,
      final String? errorMessage}) = _$GenieResposeImpl<T>;

  @override
  T? get data;
  @override
  String? get pushNamedRoute;
  @override
  String? get message;
  @override // Map<String, Object?>? dataMap,
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$GenieResposeImplCopyWith<T, _$GenieResposeImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
