import 'package:aidafine/engine/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';
part 'catalog.g.dart';

@freezed
class Catalog with _$Catalog {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory Catalog({
    required String id,
    // @Default(DateTime(2024))
    @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
    required DateTime createdAt,
    // @Default(DateTime(2024))
    @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
    DateTime? modifiedAt,
    String? name,
    String? description,
  }) = _Catalog;

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
}
