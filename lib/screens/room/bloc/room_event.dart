part of 'room_bloc.dart';

class RoomEvent {
  const RoomEvent();
}

class QueryPrompt extends RoomEvent {
  const QueryPrompt(this.prompt);
  final String prompt;
}

class VoicePrompt extends RoomEvent {
  const VoicePrompt(this.path);
  final String path;
}

class InsertChat extends RoomEvent {
  const InsertChat(this.chat);
  final Chat chat;
}

class UpdateAnswerGeneration extends RoomEvent {
  const UpdateAnswerGeneration(this.addedAnswer);
  final String addedAnswer;
}
