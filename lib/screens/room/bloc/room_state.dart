part of 'room_bloc.dart';

@freezed
class RoomState with _$RoomState {
  @JsonSerializable(explicitToJson: true)
  const factory RoomState({
    Pilot? user,
    @Default([]) List<Chat> chats,
    @Default(false) bool isLoadingAnswer,
    @Default(false) bool isGeneratingAnswer,
    Chat? answerStreaming,
  }) = _RoomState;

  factory RoomState.fromJson(Map<String, dynamic> json) =>
      _$RoomStateFromJson(json);

  const RoomState._();

  @override
  String toString() {
    return '''
RoomState(
  answerStreaming: $answerStreaming
)''';
  }
}

enum AuthState {
  signedIn,
  loading,
  signedOut,
}
