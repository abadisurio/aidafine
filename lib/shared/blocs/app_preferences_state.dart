part of 'app_preferences_bloc.dart';

@freezed
class AppPreferencesState with _$AppPreferencesState {
  const factory AppPreferencesState({
    @JsonSerializable(
      explicitToJson: true,
      includeIfNull: false,
    )
    @Default(false)
    bool callGenieWhenOpenQRIS,
    @Default({}) Map<PreferenceID, Preference<Object>> preferences,
  }) = _AppPreferencesState;

  factory AppPreferencesState.fromJson(Map<String, dynamic> json) =>
      _$AppPreferencesStateFromJson(json);

  const AppPreferencesState._();

  static const defaultValues = AppPreferencesState(
    preferences: {
      PreferenceID.callGenieWhenOpenQRIS: Preference<bool>(
        id: PreferenceID.callGenieWhenOpenQRIS,
        name: 'Call Genie when open QRIS',
        value: true,
      ),
    },
  );
}

@freezed
class Preference<T> with _$Preference<T> {
  const factory Preference({
    @JsonSerializable(
      explicitToJson: true,
      includeIfNull: false,
    )
    required PreferenceID id,
    required String name,
    Object? value,
  }) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);

  // const Preference();
}

enum PreferenceID {
  callGenieWhenOpenQRIS,
}
