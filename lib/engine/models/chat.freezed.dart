// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get data =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt => throw _privateConstructorUsedError;
  List<Catalog>? get catalogs => throw _privateConstructorUsedError;

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String id,
      String username,
      String data,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      List<Catalog>? catalogs});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? data = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? catalogs = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      catalogs: freezed == catalogs
          ? _value.catalogs
          : catalogs // ignore: cast_nullable_to_non_nullable
              as List<Catalog>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String data,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      List<Catalog>? catalogs});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? data = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? catalogs = freezed,
  }) {
    return _then(_$ChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      catalogs: freezed == catalogs
          ? _value._catalogs
          : catalogs // ignore: cast_nullable_to_non_nullable
              as List<Catalog>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$ChatImpl implements _Chat {
  _$ChatImpl(
      {required this.id,
      required this.username,
      required this.data,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required this.createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      this.modifiedAt,
      final List<Catalog>? catalogs})
      : _catalogs = catalogs;

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String data;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime createdAt;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime? modifiedAt;
  final List<Catalog>? _catalogs;
  @override
  List<Catalog>? get catalogs {
    final value = _catalogs;
    if (value == null) return null;
    if (_catalogs is EqualUnmodifiableListView) return _catalogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Chat(id: $id, username: $username, data: $data, createdAt: $createdAt, modifiedAt: $modifiedAt, catalogs: $catalogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            const DeepCollectionEquality().equals(other._catalogs, _catalogs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, data, createdAt,
      modifiedAt, const DeepCollectionEquality().hash(_catalogs));

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  factory _Chat(
      {required final String id,
      required final String username,
      required final String data,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required final DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      final DateTime? modifiedAt,
      final List<Catalog>? catalogs}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get data; // @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt; // @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt;
  @override
  List<Catalog>? get catalogs;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
