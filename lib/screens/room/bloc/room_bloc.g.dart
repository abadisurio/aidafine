// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomStateImpl _$$RoomStateImplFromJson(Map<String, dynamic> json) =>
    _$RoomStateImpl(
      user: json['user'] == null
          ? null
          : Pilot.fromJson(json['user'] as Map<String, dynamic>),
      authState: $enumDecodeNullable(_$AuthStateEnumMap, json['authState']) ??
          AuthState.loading,
    );

Map<String, dynamic> _$$RoomStateImplToJson(_$RoomStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'authState': _$AuthStateEnumMap[instance.authState]!,
    };

const _$AuthStateEnumMap = {
  AuthState.signedIn: 'signedIn',
  AuthState.loading: 'loading',
  AuthState.signedOut: 'signedOut',
};
