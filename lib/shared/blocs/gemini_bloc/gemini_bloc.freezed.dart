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

GeminiState _$GeminiStateFromJson(Map<String, dynamic> json) {
  return _GeminiState.fromJson(json);
}

/// @nodoc
mixin _$GeminiState {
  String? get pushNamedRoute => throw _privateConstructorUsedError;
  Object? get data => throw _privateConstructorUsedError;
  Map<String, Object?>? get dataMap => throw _privateConstructorUsedError;
  bool get isLoadingAnswer => throw _privateConstructorUsedError;
  bool get isGeneratingAnswer => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this GeminiState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeminiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeminiStateCopyWith<GeminiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeminiStateCopyWith<$Res> {
  factory $GeminiStateCopyWith(
          GeminiState value, $Res Function(GeminiState) then) =
      _$GeminiStateCopyWithImpl<$Res, GeminiState>;
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
class _$GeminiStateCopyWithImpl<$Res, $Val extends GeminiState>
    implements $GeminiStateCopyWith<$Res> {
  _$GeminiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeminiState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$GeminiStateImplCopyWith<$Res>
    implements $GeminiStateCopyWith<$Res> {
  factory _$$GeminiStateImplCopyWith(
          _$GeminiStateImpl value, $Res Function(_$GeminiStateImpl) then) =
      __$$GeminiStateImplCopyWithImpl<$Res>;
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
class __$$GeminiStateImplCopyWithImpl<$Res>
    extends _$GeminiStateCopyWithImpl<$Res, _$GeminiStateImpl>
    implements _$$GeminiStateImplCopyWith<$Res> {
  __$$GeminiStateImplCopyWithImpl(
      _$GeminiStateImpl _value, $Res Function(_$GeminiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeminiState
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$GeminiStateImpl(
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
class _$GeminiStateImpl extends _GeminiState {
  const _$GeminiStateImpl(
      {this.pushNamedRoute,
      this.data,
      final Map<String, Object?>? dataMap,
      this.isLoadingAnswer = false,
      this.isGeneratingAnswer = false,
      this.errorMessage})
      : _dataMap = dataMap,
        super._();

  factory _$GeminiStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeminiStateImplFromJson(json);

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
    return 'GeminiState(pushNamedRoute: $pushNamedRoute, data: $data, dataMap: $dataMap, isLoadingAnswer: $isLoadingAnswer, isGeneratingAnswer: $isGeneratingAnswer, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeminiStateImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pushNamedRoute,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_dataMap),
      isLoadingAnswer,
      isGeneratingAnswer,
      errorMessage);

  /// Create a copy of GeminiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeminiStateImplCopyWith<_$GeminiStateImpl> get copyWith =>
      __$$GeminiStateImplCopyWithImpl<_$GeminiStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeminiStateImplToJson(
      this,
    );
  }
}

abstract class _GeminiState extends GeminiState {
  const factory _GeminiState(
      {final String? pushNamedRoute,
      final Object? data,
      final Map<String, Object?>? dataMap,
      final bool isLoadingAnswer,
      final bool isGeneratingAnswer,
      final String? errorMessage}) = _$GeminiStateImpl;
  const _GeminiState._() : super._();

  factory _GeminiState.fromJson(Map<String, dynamic> json) =
      _$GeminiStateImpl.fromJson;

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

  /// Create a copy of GeminiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeminiStateImplCopyWith<_$GeminiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
