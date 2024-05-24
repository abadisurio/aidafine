part of 'gemini_bloc.dart';

class GeminiEvent {
  const GeminiEvent();
}

class VoicePrompt extends GeminiEvent {
  const VoicePrompt(this.path);
  final String path;
}
