// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pilot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PilotImpl _$$PilotImplFromJson(Map<String, dynamic> json) => _$PilotImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      createdAt: json['createdAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['createdAt']),
      modifiedAt: json['modifiedAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modifiedAt']),
      photoUrl: json['photoUrl'] as String?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$PilotImplToJson(_$PilotImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiedAt', instance.modifiedAt?.toIso8601String());
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('fcmToken', instance.fcmToken);
  return val;
}
