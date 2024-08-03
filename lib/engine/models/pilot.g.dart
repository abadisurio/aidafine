// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pilot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PilotImpl _$$PilotImplFromJson(Map<String, dynamic> json) => _$PilotImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      createdAt: json['created_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['created_at']),
      modifiedAt: json['modified_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modified_at']),
      photoUrl: json['photo_url'] as String?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$$PilotImplToJson(_$PilotImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'created_at': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modified_at', instance.modifiedAt?.toIso8601String());
  writeNotNull('photo_url', instance.photoUrl);
  writeNotNull('fcm_token', instance.fcmToken);
  return val;
}
