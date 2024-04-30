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
      authState: $enumDecodeNullable(_$AuthStateEnumMap, json['authState']) ??
          AuthState.loading,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'authState': _$AuthStateEnumMap[instance.authState]!,
    };

const _$AuthStateEnumMap = {
  AuthState.signedIn: 'signedIn',
  AuthState.loading: 'loading',
  AuthState.signedOut: 'signedOut',
};
