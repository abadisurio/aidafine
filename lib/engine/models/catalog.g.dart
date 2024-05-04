// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogImpl _$$CatalogImplFromJson(Map<String, dynamic> json) =>
    _$CatalogImpl(
      id: json['id'] as String,
      createdAt: json['createdAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['createdAt']),
      modifiedAt: json['modifiedAt'] == null
          ? getDefaultDateTime()
          : fromDateTimeJson(json['modifiedAt']),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CatalogImplToJson(_$CatalogImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiedAt', instance.modifiedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}
