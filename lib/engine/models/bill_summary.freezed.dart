// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillSummary _$BillSummaryFromJson(Map<String, dynamic> json) {
  return _BillSummary.fromJson(json);
}

/// @nodoc
mixin _$BillSummary {
  String get id => throw _privateConstructorUsedError;
  List<BillItem> get billItems => throw _privateConstructorUsedError;
  int? get grandTotal => throw _privateConstructorUsedError;
  Map<String, int?>? get additionalCharges =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillSummaryCopyWith<BillSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSummaryCopyWith<$Res> {
  factory $BillSummaryCopyWith(
          BillSummary value, $Res Function(BillSummary) then) =
      _$BillSummaryCopyWithImpl<$Res, BillSummary>;
  @useResult
  $Res call(
      {String id,
      List<BillItem> billItems,
      int? grandTotal,
      Map<String, int?>? additionalCharges});
}

/// @nodoc
class _$BillSummaryCopyWithImpl<$Res, $Val extends BillSummary>
    implements $BillSummaryCopyWith<$Res> {
  _$BillSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billItems = null,
    Object? grandTotal = freezed,
    Object? additionalCharges = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value.billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItem>,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalCharges: freezed == additionalCharges
          ? _value.additionalCharges
          : additionalCharges // ignore: cast_nullable_to_non_nullable
              as Map<String, int?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillSummaryImplCopyWith<$Res>
    implements $BillSummaryCopyWith<$Res> {
  factory _$$BillSummaryImplCopyWith(
          _$BillSummaryImpl value, $Res Function(_$BillSummaryImpl) then) =
      __$$BillSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<BillItem> billItems,
      int? grandTotal,
      Map<String, int?>? additionalCharges});
}

/// @nodoc
class __$$BillSummaryImplCopyWithImpl<$Res>
    extends _$BillSummaryCopyWithImpl<$Res, _$BillSummaryImpl>
    implements _$$BillSummaryImplCopyWith<$Res> {
  __$$BillSummaryImplCopyWithImpl(
      _$BillSummaryImpl _value, $Res Function(_$BillSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billItems = null,
    Object? grandTotal = freezed,
    Object? additionalCharges = freezed,
  }) {
    return _then(_$BillSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value._billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItem>,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalCharges: freezed == additionalCharges
          ? _value._additionalCharges
          : additionalCharges // ignore: cast_nullable_to_non_nullable
              as Map<String, int?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BillSummaryImpl implements _BillSummary {
  _$BillSummaryImpl(
      {required this.id,
      final List<BillItem> billItems = const [],
      this.grandTotal,
      final Map<String, int?>? additionalCharges})
      : _billItems = billItems,
        _additionalCharges = additionalCharges;

  factory _$BillSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillSummaryImplFromJson(json);

  @override
  final String id;
  final List<BillItem> _billItems;
  @override
  @JsonKey()
  List<BillItem> get billItems {
    if (_billItems is EqualUnmodifiableListView) return _billItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billItems);
  }

  @override
  final int? grandTotal;
  final Map<String, int?>? _additionalCharges;
  @override
  Map<String, int?>? get additionalCharges {
    final value = _additionalCharges;
    if (value == null) return null;
    if (_additionalCharges is EqualUnmodifiableMapView)
      return _additionalCharges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BillSummary(id: $id, billItems: $billItems, grandTotal: $grandTotal, additionalCharges: $additionalCharges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._billItems, _billItems) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            const DeepCollectionEquality()
                .equals(other._additionalCharges, _additionalCharges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_billItems),
      grandTotal,
      const DeepCollectionEquality().hash(_additionalCharges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillSummaryImplCopyWith<_$BillSummaryImpl> get copyWith =>
      __$$BillSummaryImplCopyWithImpl<_$BillSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillSummaryImplToJson(
      this,
    );
  }
}

abstract class _BillSummary implements BillSummary {
  factory _BillSummary(
      {required final String id,
      final List<BillItem> billItems,
      final int? grandTotal,
      final Map<String, int?>? additionalCharges}) = _$BillSummaryImpl;

  factory _BillSummary.fromJson(Map<String, dynamic> json) =
      _$BillSummaryImpl.fromJson;

  @override
  String get id;
  @override
  List<BillItem> get billItems;
  @override
  int? get grandTotal;
  @override
  Map<String, int?>? get additionalCharges;
  @override
  @JsonKey(ignore: true)
  _$$BillSummaryImplCopyWith<_$BillSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
