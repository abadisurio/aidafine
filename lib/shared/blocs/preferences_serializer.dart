import 'package:aidafine/shared/blocs/app_preferences_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PreferenceSerializer
    implements JsonConverter<Preference<Object>?, dynamic> {
  const PreferenceSerializer();

  @override
  Preference<Object>? fromJson(dynamic data) {
    if (data is Map<Object?, Object?>) {
      final json = data.cast<String, dynamic>();
      final id = json['id'] as PreferenceID;
      final name = json['name'] as String;
      if (json is bool) {
        return Preference(
          id: id,
          name: name,
          value: json['value'] as bool,
        );
      }
      if (json is String) {
        return Preference(
          id: id,
          name: name,
          value: json['value'] as String,
        );
      }
      if (json is num) {
        return Preference(
          id: id,
          name: name,
          value: json['value'] as num,
        );
      }
      return Preference.fromJson(json);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(Preference<dynamic>? object) {
    return object?.toJson();
  }
}
