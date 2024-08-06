// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preferences_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPreferencesStateImpl _$$AppPreferencesStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppPreferencesStateImpl(
      callGenieWhenOpenQRIS:
          json['call_genie_when_open_q_r_i_s'] as bool? ?? false,
      preferences: (json['preferences'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$PreferenceIDEnumMap, k),
                Preference<Object>.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$AppPreferencesStateImplToJson(
        _$AppPreferencesStateImpl instance) =>
    <String, dynamic>{
      'call_genie_when_open_q_r_i_s': instance.callGenieWhenOpenQRIS,
      'preferences': instance.preferences
          .map((k, e) => MapEntry(_$PreferenceIDEnumMap[k]!, e.toJson())),
    };

const _$PreferenceIDEnumMap = {
  PreferenceID.callGenieWhenOpenQRIS: 'callGenieWhenOpenQRIS',
};

_$PreferenceImpl<T> _$$PreferenceImplFromJson<T>(Map<String, dynamic> json) =>
    _$PreferenceImpl<T>(
      id: $enumDecode(_$PreferenceIDEnumMap, json['id']),
      name: json['name'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$$PreferenceImplToJson<T>(_$PreferenceImpl<T> instance) {
  final val = <String, dynamic>{
    'id': _$PreferenceIDEnumMap[instance.id]!,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}
