// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      data: json['data'] as String,
      createdAt: json['createdAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['createdAt']),
      modifiedAt: json['modifiedAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modifiedAt']),
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'data': instance.data,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiedAt', instance.modifiedAt?.toIso8601String());
  return val;
}
