// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillItem _$BillItemFromJson(Map<String, dynamic> json) {
  return _BillItem.fromJson(json);
}

/// @nodoc
mixin _$BillItem {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillItemCopyWith<BillItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemCopyWith<$Res> {
  factory $BillItemCopyWith(BillItem value, $Res Function(BillItem) then) =
      _$BillItemCopyWithImpl<$Res, BillItem>;
  @useResult
  $Res call({String id, String? name, int? quantity, int? price});
}

/// @nodoc
class _$BillItemCopyWithImpl<$Res, $Val extends BillItem>
    implements $BillItemCopyWith<$Res> {
  _$BillItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillItemImplCopyWith<$Res>
    implements $BillItemCopyWith<$Res> {
  factory _$$BillItemImplCopyWith(
          _$BillItemImpl value, $Res Function(_$BillItemImpl) then) =
      __$$BillItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, int? quantity, int? price});
}

/// @nodoc
class __$$BillItemImplCopyWithImpl<$Res>
    extends _$BillItemCopyWithImpl<$Res, _$BillItemImpl>
    implements _$$BillItemImplCopyWith<$Res> {
  __$$BillItemImplCopyWithImpl(
      _$BillItemImpl _value, $Res Function(_$BillItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
  }) {
    return _then(_$BillItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BillItemImpl implements _BillItem {
  _$BillItemImpl({required this.id, this.name, this.quantity, this.price});

  factory _$BillItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillItemImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final int? quantity;
  @override
  final int? price;

  @override
  String toString() {
    return 'BillItem(id: $id, name: $name, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemImplCopyWith<_$BillItemImpl> get copyWith =>
      __$$BillItemImplCopyWithImpl<_$BillItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillItemImplToJson(
      this,
    );
  }
}

abstract class _BillItem implements BillItem {
  factory _BillItem(
      {required final String id,
      final String? name,
      final int? quantity,
      final int? price}) = _$BillItemImpl;

  factory _BillItem.fromJson(Map<String, dynamic> json) =
      _$BillItemImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  int? get quantity;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$BillItemImplCopyWith<_$BillItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
