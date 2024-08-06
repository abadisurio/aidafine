// import 'package:aidafine/shared/blocs/preferences_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_preferences_event.dart';
part 'app_preferences_state.dart';
part 'app_preferences_bloc.g.dart';
part 'app_preferences_bloc.freezed.dart';

class AppPreferencesBloc
    extends HydratedBloc<AppPreferencesEvent, AppPreferencesState> {
  AppPreferencesBloc() : super(AppPreferencesState.defaultValues) {
    on<ToggleBoolean>(_onToggleBoolean);
  }

  Future<void> _onToggleBoolean(
    ToggleBoolean event,
    Emitter<AppPreferencesState> emit,
  ) async {
    final newPref = {...state.preferences};
    newPref[event.id] = newPref[event.id]!.copyWith(
      value: event.value,
    );
    emit(
      state.copyWith(
        preferences: newPref,
      ),
    );
  }

  @override
  AppPreferencesState? fromJson(Map<String, dynamic> json) {
    // return null;
    return AppPreferencesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppPreferencesState state) {
    // return null;
    return state.toJson();
  }
}
