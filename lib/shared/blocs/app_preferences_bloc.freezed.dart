// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppPreferencesState _$AppPreferencesStateFromJson(Map<String, dynamic> json) {
  return _AppPreferencesState.fromJson(json);
}

/// @nodoc
mixin _$AppPreferencesState {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  bool get callGenieWhenOpenQRIS => throw _privateConstructorUsedError;
  Map<PreferenceID, Preference<Object>> get preferences =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppPreferencesStateCopyWith<AppPreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPreferencesStateCopyWith<$Res> {
  factory $AppPreferencesStateCopyWith(
          AppPreferencesState value, $Res Function(AppPreferencesState) then) =
      _$AppPreferencesStateCopyWithImpl<$Res, AppPreferencesState>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      bool callGenieWhenOpenQRIS,
      Map<PreferenceID, Preference<Object>> preferences});
}

/// @nodoc
class _$AppPreferencesStateCopyWithImpl<$Res, $Val extends AppPreferencesState>
    implements $AppPreferencesStateCopyWith<$Res> {
  _$AppPreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callGenieWhenOpenQRIS = null,
    Object? preferences = null,
  }) {
    return _then(_value.copyWith(
      callGenieWhenOpenQRIS: null == callGenieWhenOpenQRIS
          ? _value.callGenieWhenOpenQRIS
          : callGenieWhenOpenQRIS // ignore: cast_nullable_to_non_nullable
              as bool,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<PreferenceID, Preference<Object>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPreferencesStateImplCopyWith<$Res>
    implements $AppPreferencesStateCopyWith<$Res> {
  factory _$$AppPreferencesStateImplCopyWith(_$AppPreferencesStateImpl value,
          $Res Function(_$AppPreferencesStateImpl) then) =
      __$$AppPreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      bool callGenieWhenOpenQRIS,
      Map<PreferenceID, Preference<Object>> preferences});
}

/// @nodoc
class __$$AppPreferencesStateImplCopyWithImpl<$Res>
    extends _$AppPreferencesStateCopyWithImpl<$Res, _$AppPreferencesStateImpl>
    implements _$$AppPreferencesStateImplCopyWith<$Res> {
  __$$AppPreferencesStateImplCopyWithImpl(_$AppPreferencesStateImpl _value,
      $Res Function(_$AppPreferencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callGenieWhenOpenQRIS = null,
    Object? preferences = null,
  }) {
    return _then(_$AppPreferencesStateImpl(
      callGenieWhenOpenQRIS: null == callGenieWhenOpenQRIS
          ? _value.callGenieWhenOpenQRIS
          : callGenieWhenOpenQRIS // ignore: cast_nullable_to_non_nullable
              as bool,
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<PreferenceID, Preference<Object>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPreferencesStateImpl extends _AppPreferencesState {
  const _$AppPreferencesStateImpl(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      this.callGenieWhenOpenQRIS = false,
      final Map<PreferenceID, Preference<Object>> preferences = const {}})
      : _preferences = preferences,
        super._();

  factory _$AppPreferencesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPreferencesStateImplFromJson(json);

  @override
  @JsonKey()
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  final bool callGenieWhenOpenQRIS;
  final Map<PreferenceID, Preference<Object>> _preferences;
  @override
  @JsonKey()
  Map<PreferenceID, Preference<Object>> get preferences {
    if (_preferences is EqualUnmodifiableMapView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_preferences);
  }

  @override
  String toString() {
    return 'AppPreferencesState(callGenieWhenOpenQRIS: $callGenieWhenOpenQRIS, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPreferencesStateImpl &&
            (identical(other.callGenieWhenOpenQRIS, callGenieWhenOpenQRIS) ||
                other.callGenieWhenOpenQRIS == callGenieWhenOpenQRIS) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, callGenieWhenOpenQRIS,
      const DeepCollectionEquality().hash(_preferences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPreferencesStateImplCopyWith<_$AppPreferencesStateImpl> get copyWith =>
      __$$AppPreferencesStateImplCopyWithImpl<_$AppPreferencesStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPreferencesStateImplToJson(
      this,
    );
  }
}

abstract class _AppPreferencesState extends AppPreferencesState {
  const factory _AppPreferencesState(
          {@JsonSerializable(explicitToJson: true, includeIfNull: false)
          final bool callGenieWhenOpenQRIS,
          final Map<PreferenceID, Preference<Object>> preferences}) =
      _$AppPreferencesStateImpl;
  const _AppPreferencesState._() : super._();

  factory _AppPreferencesState.fromJson(Map<String, dynamic> json) =
      _$AppPreferencesStateImpl.fromJson;

  @override
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  bool get callGenieWhenOpenQRIS;
  @override
  Map<PreferenceID, Preference<Object>> get preferences;
  @override
  @JsonKey(ignore: true)
  _$$AppPreferencesStateImplCopyWith<_$AppPreferencesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Preference<T> _$PreferenceFromJson<T>(Map<String, dynamic> json) {
  return _Preference<T>.fromJson(json);
}

/// @nodoc
mixin _$Preference<T> {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  PreferenceID get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Object? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceCopyWith<T, Preference<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceCopyWith<T, $Res> {
  factory $PreferenceCopyWith(
          Preference<T> value, $Res Function(Preference<T>) then) =
      _$PreferenceCopyWithImpl<T, $Res, Preference<T>>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      PreferenceID id,
      String name,
      Object? value});
}

/// @nodoc
class _$PreferenceCopyWithImpl<T, $Res, $Val extends Preference<T>>
    implements $PreferenceCopyWith<T, $Res> {
  _$PreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as PreferenceID,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value ? _value.value : value,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceImplCopyWith<T, $Res>
    implements $PreferenceCopyWith<T, $Res> {
  factory _$$PreferenceImplCopyWith(
          _$PreferenceImpl<T> value, $Res Function(_$PreferenceImpl<T>) then) =
      __$$PreferenceImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      PreferenceID id,
      String name,
      Object? value});
}

/// @nodoc
class __$$PreferenceImplCopyWithImpl<T, $Res>
    extends _$PreferenceCopyWithImpl<T, $Res, _$PreferenceImpl<T>>
    implements _$$PreferenceImplCopyWith<T, $Res> {
  __$$PreferenceImplCopyWithImpl(
      _$PreferenceImpl<T> _value, $Res Function(_$PreferenceImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = freezed,
  }) {
    return _then(_$PreferenceImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as PreferenceID,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceImpl<T> implements _Preference<T> {
  const _$PreferenceImpl(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      required this.id,
      required this.name,
      this.value});

  factory _$PreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceImplFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  final PreferenceID id;
  @override
  final String name;
  @override
  final Object? value;

  @override
  String toString() {
    return 'Preference<$T>(id: $id, name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceImplCopyWith<T, _$PreferenceImpl<T>> get copyWith =>
      __$$PreferenceImplCopyWithImpl<T, _$PreferenceImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceImplToJson<T>(
      this,
    );
  }
}

abstract class _Preference<T> implements Preference<T> {
  const factory _Preference(
      {@JsonSerializable(explicitToJson: true, includeIfNull: false)
      required final PreferenceID id,
      required final String name,
      final Object? value}) = _$PreferenceImpl<T>;

  factory _Preference.fromJson(Map<String, dynamic> json) =
      _$PreferenceImpl<T>.fromJson;

  @override
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  PreferenceID get id;
  @override
  String get name;
  @override
  Object? get value;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceImplCopyWith<T, _$PreferenceImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
