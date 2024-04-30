import 'package:aidafine/engine/models/helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pilot.freezed.dart';
part 'pilot.g.dart';

@freezed
class Pilot with _$Pilot {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory Pilot({
    required String id,
    required String username,
    // @Default(DateTime(2024))
    @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
    required DateTime createdAt,
    // @Default(DateTime(2024))
    @JsonKey(defaultValue: getDefaultDateTime, fromJson: fromDateTimeJson)
    DateTime? modifiedAt,
    String? photoUrl,
    String? fcmToken,
  }) = _Pilot;

  factory Pilot.fromJson(Map<String, dynamic> json) => _$PilotFromJson(json);
}
