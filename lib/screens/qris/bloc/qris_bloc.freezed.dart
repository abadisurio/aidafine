// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QRISState {
  double? get amount => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRISStateCopyWith<QRISState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRISStateCopyWith<$Res> {
  factory $QRISStateCopyWith(QRISState value, $Res Function(QRISState) then) =
      _$QRISStateCopyWithImpl<$Res, QRISState>;
  @useResult
  $Res call({double? amount, String? errorMessage});
}

/// @nodoc
class _$QRISStateCopyWithImpl<$Res, $Val extends QRISState>
    implements $QRISStateCopyWith<$Res> {
  _$QRISStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$QRISStateImplCopyWith<$Res>
    implements $QRISStateCopyWith<$Res> {
  factory _$$QRISStateImplCopyWith(
          _$QRISStateImpl value, $Res Function(_$QRISStateImpl) then) =
      __$$QRISStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? amount, String? errorMessage});
}

/// @nodoc
class __$$QRISStateImplCopyWithImpl<$Res>
    extends _$QRISStateCopyWithImpl<$Res, _$QRISStateImpl>
    implements _$$QRISStateImplCopyWith<$Res> {
  __$$QRISStateImplCopyWithImpl(
      _$QRISStateImpl _value, $Res Function(_$QRISStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$QRISStateImpl(
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

class _$QRISStateImpl implements _QRISState {
  const _$QRISStateImpl({this.amount, this.errorMessage});

  @override
  final double? amount;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'QRISState(amount: $amount, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRISStateImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QRISStateImplCopyWith<_$QRISStateImpl> get copyWith =>
      __$$QRISStateImplCopyWithImpl<_$QRISStateImpl>(this, _$identity);
}

abstract class _QRISState implements QRISState {
  const factory _QRISState({final double? amount, final String? errorMessage}) =
      _$QRISStateImpl;

  @override
  double? get amount;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$QRISStateImplCopyWith<_$QRISStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
