part of 'room_bloc.dart';

class RoomEvent {
  const RoomEvent();
}

class QueryPrompt extends RoomEvent {
  const QueryPrompt(this.prompt);
  final String prompt;
}

class UpdateAnswerGeneration extends RoomEvent {
  const UpdateAnswerGeneration(this.addedAnswer);
  final String addedAnswer;
}
