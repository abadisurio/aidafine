// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gemini_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeminiVoiceState _$GeminiVoiceStateFromJson(Map<String, dynamic> json) {
  return _GeminiVoiceState.fromJson(json);
}

/// @nodoc
mixin _$GeminiVoiceState {
  String? get pushNamedRoute => throw _privateConstructorUsedError;
  Object? get data => throw _privateConstructorUsedError;
  Map<String, Object?>? get dataMap => throw _privateConstructorUsedError;
  bool get isLoadingAnswer => throw _privateConstructorUsedError;
  bool get isGeneratingAnswer => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      {String? pushNamedRoute,
      Object? data,
      Map<String, Object?>? dataMap,
      bool isLoadingAnswer,
      bool isGeneratingAnswer,
      String? errorMessage});
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
    Object? pushNamedRoute = freezed,
    Object? data = freezed,
    Object? dataMap = freezed,
    Object? isLoadingAnswer = null,
    Object? isGeneratingAnswer = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      pushNamedRoute: freezed == pushNamedRoute
          ? _value.pushNamedRoute
          : pushNamedRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data ? _value.data : data,
      dataMap: freezed == dataMap
          ? _value.dataMap
          : dataMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String? pushNamedRoute,
      Object? data,
      Map<String, Object?>? dataMap,
      bool isLoadingAnswer,
      bool isGeneratingAnswer,
      String? errorMessage});
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
    Object? pushNamedRoute = freezed,
    Object? data = freezed,
    Object? dataMap = freezed,
    Object? isLoadingAnswer = null,
    Object? isGeneratingAnswer = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$GeminiVoiceStateImpl(
      pushNamedRoute: freezed == pushNamedRoute
          ? _value.pushNamedRoute
          : pushNamedRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data ? _value.data : data,
      dataMap: freezed == dataMap
          ? _value._dataMap
          : dataMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GeminiVoiceStateImpl extends _GeminiVoiceState {
  const _$GeminiVoiceStateImpl(
      {this.pushNamedRoute,
      this.data,
      final Map<String, Object?>? dataMap,
      this.isLoadingAnswer = false,
      this.isGeneratingAnswer = false,
      this.errorMessage})
      : _dataMap = dataMap,
        super._();

  factory _$GeminiVoiceStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeminiVoiceStateImplFromJson(json);

  @override
  final String? pushNamedRoute;
  @override
  final Object? data;
  final Map<String, Object?>? _dataMap;
  @override
  Map<String, Object?>? get dataMap {
    final value = _dataMap;
    if (value == null) return null;
    if (_dataMap is EqualUnmodifiableMapView) return _dataMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isLoadingAnswer;
  @override
  @JsonKey()
  final bool isGeneratingAnswer;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GeminiVoiceState(pushNamedRoute: $pushNamedRoute, data: $data, dataMap: $dataMap, isLoadingAnswer: $isLoadingAnswer, isGeneratingAnswer: $isGeneratingAnswer, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeminiVoiceStateImpl &&
            (identical(other.pushNamedRoute, pushNamedRoute) ||
                other.pushNamedRoute == pushNamedRoute) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._dataMap, _dataMap) &&
            (identical(other.isLoadingAnswer, isLoadingAnswer) ||
                other.isLoadingAnswer == isLoadingAnswer) &&
            (identical(other.isGeneratingAnswer, isGeneratingAnswer) ||
                other.isGeneratingAnswer == isGeneratingAnswer) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pushNamedRoute,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_dataMap),
      isLoadingAnswer,
      isGeneratingAnswer,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeminiVoiceStateImplCopyWith<_$GeminiVoiceStateImpl> get copyWith =>
      __$$GeminiVoiceStateImplCopyWithImpl<_$GeminiVoiceStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeminiVoiceStateImplToJson(
      this,
    );
  }
}

abstract class _GeminiVoiceState extends GeminiVoiceState {
  const factory _GeminiVoiceState(
      {final String? pushNamedRoute,
      final Object? data,
      final Map<String, Object?>? dataMap,
      final bool isLoadingAnswer,
      final bool isGeneratingAnswer,
      final String? errorMessage}) = _$GeminiVoiceStateImpl;
  const _GeminiVoiceState._() : super._();

  factory _GeminiVoiceState.fromJson(Map<String, dynamic> json) =
      _$GeminiVoiceStateImpl.fromJson;

  @override
  String? get pushNamedRoute;
  @override
  Object? get data;
  @override
  Map<String, Object?>? get dataMap;
  @override
  bool get isLoadingAnswer;
  @override
  bool get isGeneratingAnswer;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$GeminiVoiceStateImplCopyWith<_$GeminiVoiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
