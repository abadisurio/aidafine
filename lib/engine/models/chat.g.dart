// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      data: json['data'] as String,
      createdAt: json['created_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['created_at']),
      modifiedAt: json['modified_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modified_at']),
      catalogs: (json['catalogs'] as List<dynamic>?)
          ?.map((e) => Catalog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'data': instance.data,
    'created_at': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modified_at', instance.modifiedAt?.toIso8601String());
  writeNotNull('catalogs', instance.catalogs?.map((e) => e.toJson()).toList());
  return val;
}
