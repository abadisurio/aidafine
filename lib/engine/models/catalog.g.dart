// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogImpl _$$CatalogImplFromJson(Map<String, dynamic> json) =>
    _$CatalogImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['created_at']),
      modifiedAt: json['modified_at'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modified_at']),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CatalogImplToJson(_$CatalogImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modified_at', instance.modifiedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}
