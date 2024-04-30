part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  @JsonSerializable(explicitToJson: true)
  const factory UserState({
    Pilot? user,
    @Default(AuthState.loading) AuthState authState,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  const UserState._();
}

enum AuthState {
  signedIn,
  loading,
  signedOut,
}
