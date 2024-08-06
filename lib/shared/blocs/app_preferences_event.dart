part of 'app_preferences_bloc.dart';

class AppPreferencesEvent {
  const AppPreferencesEvent();
}

class ToggleBoolean extends AppPreferencesEvent {
  const ToggleBoolean({
    required this.id,
    required this.value,
  });

  final PreferenceID id;
  final bool value;
}
