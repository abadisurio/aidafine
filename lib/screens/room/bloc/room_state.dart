part of 'room_bloc.dart';

@freezed
class RoomState with _$RoomState {
  @JsonSerializable(explicitToJson: true)
  const factory RoomState({
    Pilot? user,
    @Default(AuthState.loading) AuthState authState,
  }) = _RoomState;

  factory RoomState.fromJson(Map<String, dynamic> json) =>
      _$RoomStateFromJson(json);

  const RoomState._();
}

enum AuthState {
  signedIn,
  loading,
  signedOut,
}
