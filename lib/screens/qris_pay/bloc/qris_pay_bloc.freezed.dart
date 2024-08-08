// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_pay_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QRISPayState {
  bool get isScanning => throw _privateConstructorUsedError;
  EmvqrModel? get qrisData => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRISPayStateCopyWith<QRISPayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRISPayStateCopyWith<$Res> {
  factory $QRISPayStateCopyWith(
          QRISPayState value, $Res Function(QRISPayState) then) =
      _$QRISPayStateCopyWithImpl<$Res, QRISPayState>;
  @useResult
  $Res call(
      {bool isScanning,
      EmvqrModel? qrisData,
      double? amount,
      String? errorMessage});
}

/// @nodoc
class _$QRISPayStateCopyWithImpl<$Res, $Val extends QRISPayState>
    implements $QRISPayStateCopyWith<$Res> {
  _$QRISPayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? qrisData = freezed,
    Object? amount = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      qrisData: freezed == qrisData
          ? _value.qrisData
          : qrisData // ignore: cast_nullable_to_non_nullable
              as EmvqrModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QRISPayStateImplCopyWith<$Res>
    implements $QRISPayStateCopyWith<$Res> {
  factory _$$QRISPayStateImplCopyWith(
          _$QRISPayStateImpl value, $Res Function(_$QRISPayStateImpl) then) =
      __$$QRISPayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isScanning,
      EmvqrModel? qrisData,
      double? amount,
      String? errorMessage});
}

/// @nodoc
class __$$QRISPayStateImplCopyWithImpl<$Res>
    extends _$QRISPayStateCopyWithImpl<$Res, _$QRISPayStateImpl>
    implements _$$QRISPayStateImplCopyWith<$Res> {
  __$$QRISPayStateImplCopyWithImpl(
      _$QRISPayStateImpl _value, $Res Function(_$QRISPayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? qrisData = freezed,
    Object? amount = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$QRISPayStateImpl(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      qrisData: freezed == qrisData
          ? _value.qrisData
          : qrisData // ignore: cast_nullable_to_non_nullable
              as EmvqrModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$QRISPayStateImpl implements _QRISPayState {
  const _$QRISPayStateImpl(
      {this.isScanning = false, this.qrisData, this.amount, this.errorMessage});

  @override
  @JsonKey()
  final bool isScanning;
  @override
  final EmvqrModel? qrisData;
  @override
  final double? amount;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'QRISPayState(isScanning: $isScanning, qrisData: $qrisData, amount: $amount, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRISPayStateImpl &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.qrisData, qrisData) ||
                other.qrisData == qrisData) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isScanning, qrisData, amount, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QRISPayStateImplCopyWith<_$QRISPayStateImpl> get copyWith =>
      __$$QRISPayStateImplCopyWithImpl<_$QRISPayStateImpl>(this, _$identity);
}

abstract class _QRISPayState implements QRISPayState {
  const factory _QRISPayState(
      {final bool isScanning,
      final EmvqrModel? qrisData,
      final double? amount,
      final String? errorMessage}) = _$QRISPayStateImpl;

  @override
  bool get isScanning;
  @override
  EmvqrModel? get qrisData;
  @override
  double? get amount;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$QRISPayStateImplCopyWith<_$QRISPayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
