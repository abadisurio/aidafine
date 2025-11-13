// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pilot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pilot _$PilotFromJson(Map<String, dynamic> json) {
  return _Pilot.fromJson(json);
}

/// @nodoc
mixin _$Pilot {
  String get id => throw _privateConstructorUsedError;
  String get username =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // @Default(DateTime(2024))
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this Pilot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pilot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PilotCopyWith<Pilot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PilotCopyWith<$Res> {
  factory $PilotCopyWith(Pilot value, $Res Function(Pilot) then) =
      _$PilotCopyWithImpl<$Res, Pilot>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      String? photoUrl,
      String? fcmToken});
}

/// @nodoc
class _$PilotCopyWithImpl<$Res, $Val extends Pilot>
    implements $PilotCopyWith<$Res> {
  _$PilotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pilot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? photoUrl = freezed,
    Object? fcmToken = freezed,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PilotImplCopyWith<$Res> implements $PilotCopyWith<$Res> {
  factory _$$PilotImplCopyWith(
          _$PilotImpl value, $Res Function(_$PilotImpl) then) =
      __$$PilotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      DateTime? modifiedAt,
      String? photoUrl,
      String? fcmToken});
}

/// @nodoc
class __$$PilotImplCopyWithImpl<$Res>
    extends _$PilotCopyWithImpl<$Res, _$PilotImpl>
    implements _$$PilotImplCopyWith<$Res> {
  __$$PilotImplCopyWithImpl(
      _$PilotImpl _value, $Res Function(_$PilotImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pilot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? createdAt = null,
    Object? modifiedAt = freezed,
    Object? photoUrl = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_$PilotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$PilotImpl implements _Pilot {
  _$PilotImpl(
      {required this.id,
      required this.username,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required this.createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      this.modifiedAt,
      this.photoUrl,
      this.fcmToken});

  factory _$PilotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PilotImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime createdAt;
// @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  final DateTime? modifiedAt;
  @override
  final String? photoUrl;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'Pilot(id: $id, username: $username, createdAt: $createdAt, modifiedAt: $modifiedAt, photoUrl: $photoUrl, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PilotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, createdAt, modifiedAt, photoUrl, fcmToken);

  /// Create a copy of Pilot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PilotImplCopyWith<_$PilotImpl> get copyWith =>
      __$$PilotImplCopyWithImpl<_$PilotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PilotImplToJson(
      this,
    );
  }
}

abstract class _Pilot implements Pilot {
  factory _Pilot(
      {required final String id,
      required final String username,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      required final DateTime createdAt,
      @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
      final DateTime? modifiedAt,
      final String? photoUrl,
      final String? fcmToken}) = _$PilotImpl;

  factory _Pilot.fromJson(Map<String, dynamic> json) = _$PilotImpl.fromJson;

  @override
  String get id;
  @override
  String get username; // @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime get createdAt; // @Default(DateTime(2024))
  @override
  @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
  DateTime? get modifiedAt;
  @override
  String? get photoUrl;
  @override
  String? get fcmToken;

  /// Create a copy of Pilot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PilotImplCopyWith<_$PilotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
