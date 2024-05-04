// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Catalog _$CatalogFromJson(Map<String, dynamic> json) {
  return _Catalog.fromJson(json);
}

/// @nodoc
mixin _$Catalog {
  String get id =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogCopyWith<Catalog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogCopyWith<$Res> {
  factory $CatalogCopyWith(Catalog value, $Res Function(Catalog) then) =
      _$CatalogCopyWithImpl<$Res, Catalog>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      String? name,
      String? description});
}

/// @nodoc
class _$CatalogCopyWithImpl<$Res, $Val extends Catalog>
    implements $CatalogCopyWith<$Res> {
  _$CatalogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatalogImplCopyWith<$Res> implements $CatalogCopyWith<$Res> {
  factory _$$CatalogImplCopyWith(
          _$CatalogImpl value, $Res Function(_$CatalogImpl) then) =
      __$$CatalogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      String? name,
      String? description});
}

/// @nodoc
class __$$CatalogImplCopyWithImpl<$Res>
    extends _$CatalogCopyWithImpl<$Res, _$CatalogImpl>
    implements _$$CatalogImplCopyWith<$Res> {
  __$$CatalogImplCopyWithImpl(
      _$CatalogImpl _value, $Res Function(_$CatalogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CatalogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$CatalogImpl implements _Catalog {
  _$CatalogImpl(
      {required this.id,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required this.createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      this.modifiedAt,
      this.name,
      this.description});

  factory _$CatalogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogImplFromJson(json);

  @override
  final String id;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime createdAt;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime? modifiedAt;
  @override
  final String? name;
  @override
  final String? description;

  @override
  String toString() {
    return 'Catalog(id: $id, createdAt: $createdAt, modifiedAt: $modifiedAt, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, modifiedAt, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogImplCopyWith<_$CatalogImpl> get copyWith =>
      __$$CatalogImplCopyWithImpl<_$CatalogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogImplToJson(
      this,
    );
  }
}

abstract class _Catalog implements Catalog {
  factory _Catalog(
      {required final String id,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required final DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      final DateTime? modifiedAt,
      final String? name,
      final String? description}) = _$CatalogImpl;

  factory _Catalog.fromJson(Map<String, dynamic> json) = _$CatalogImpl.fromJson;

  @override
  String get id;
  @override // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt;
  @override // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CatalogImplCopyWith<_$CatalogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
