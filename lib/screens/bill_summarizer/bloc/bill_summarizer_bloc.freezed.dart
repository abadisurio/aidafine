// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_summarizer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BillSummarizerState {
  DateTime get createdAt => throw _privateConstructorUsedError;
  BillSummary get billSummary => throw _privateConstructorUsedError;
  DateTime? get modifiedAt => throw _privateConstructorUsedError;
  bool get isGeneratingAnswer => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillSummarizerStateCopyWith<BillSummarizerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSummarizerStateCopyWith<$Res> {
  factory $BillSummarizerStateCopyWith(
          BillSummarizerState value, $Res Function(BillSummarizerState) then) =
      _$BillSummarizerStateCopyWithImpl<$Res, BillSummarizerState>;
  @useResult
  $Res call(
      {DateTime createdAt,
      BillSummary billSummary,
      DateTime? modifiedAt,
      bool isGeneratingAnswer,
      String? errorMessage});

  $BillSummaryCopyWith<$Res> get billSummary;
}

/// @nodoc
class _$BillSummarizerStateCopyWithImpl<$Res, $Val extends BillSummarizerState>
    implements $BillSummarizerStateCopyWith<$Res> {
  _$BillSummarizerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? billSummary = null,
    Object? modifiedAt = freezed,
    Object? isGeneratingAnswer = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billSummary: null == billSummary
          ? _value.billSummary
          : billSummary // ignore: cast_nullable_to_non_nullable
              as BillSummary,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  @override
  @pragma('vm:prefer-inline')
  $BillSummaryCopyWith<$Res> get billSummary {
    return $BillSummaryCopyWith<$Res>(_value.billSummary, (value) {
      return _then(_value.copyWith(billSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillSummarizerStateImplCopyWith<$Res>
    implements $BillSummarizerStateCopyWith<$Res> {
  factory _$$BillSummarizerStateImplCopyWith(_$BillSummarizerStateImpl value,
          $Res Function(_$BillSummarizerStateImpl) then) =
      __$$BillSummarizerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      BillSummary billSummary,
      DateTime? modifiedAt,
      bool isGeneratingAnswer,
      String? errorMessage});

  @override
  $BillSummaryCopyWith<$Res> get billSummary;
}

/// @nodoc
class __$$BillSummarizerStateImplCopyWithImpl<$Res>
    extends _$BillSummarizerStateCopyWithImpl<$Res, _$BillSummarizerStateImpl>
    implements _$$BillSummarizerStateImplCopyWith<$Res> {
  __$$BillSummarizerStateImplCopyWithImpl(_$BillSummarizerStateImpl _value,
      $Res Function(_$BillSummarizerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? billSummary = null,
    Object? modifiedAt = freezed,
    Object? isGeneratingAnswer = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BillSummarizerStateImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billSummary: null == billSummary
          ? _value.billSummary
          : billSummary // ignore: cast_nullable_to_non_nullable
              as BillSummary,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

class _$BillSummarizerStateImpl extends _BillSummarizerState {
  const _$BillSummarizerStateImpl(
      {required this.createdAt,
      required this.billSummary,
      this.modifiedAt,
      this.isGeneratingAnswer = false,
      this.errorMessage})
      : super._();

  @override
  final DateTime createdAt;
  @override
  final BillSummary billSummary;
  @override
  final DateTime? modifiedAt;
  @override
  @JsonKey()
  final bool isGeneratingAnswer;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BillSummarizerState(createdAt: $createdAt, billSummary: $billSummary, modifiedAt: $modifiedAt, isGeneratingAnswer: $isGeneratingAnswer, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillSummarizerStateImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.billSummary, billSummary) ||
                other.billSummary == billSummary) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.isGeneratingAnswer, isGeneratingAnswer) ||
                other.isGeneratingAnswer == isGeneratingAnswer) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, billSummary,
      modifiedAt, isGeneratingAnswer, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillSummarizerStateImplCopyWith<_$BillSummarizerStateImpl> get copyWith =>
      __$$BillSummarizerStateImplCopyWithImpl<_$BillSummarizerStateImpl>(
          this, _$identity);
}

abstract class _BillSummarizerState extends BillSummarizerState {
  const factory _BillSummarizerState(
      {required final DateTime createdAt,
      required final BillSummary billSummary,
      final DateTime? modifiedAt,
      final bool isGeneratingAnswer,
      final String? errorMessage}) = _$BillSummarizerStateImpl;
  const _BillSummarizerState._() : super._();

  @override
  DateTime get createdAt;
  @override
  BillSummary get billSummary;
  @override
  DateTime? get modifiedAt;
  @override
  bool get isGeneratingAnswer;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BillSummarizerStateImplCopyWith<_$BillSummarizerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
