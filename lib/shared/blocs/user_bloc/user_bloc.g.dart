// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      user: json['user'] == null
          ? null
          : Pilot.fromJson(json['user'] as Map<String, dynamic>),
      authState: $enumDecodeNullable(_$AuthStateEnumMap, json['auth_state']) ??
          AuthState.loading,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  val['auth_state'] = _$AuthStateEnumMap[instance.authState]!;
  return val;
}

const _$AuthStateEnumMap = {
  AuthState.signedIn: 'signedIn',
  AuthState.loading: 'loading',
  AuthState.signedOut: 'signedOut',
};
