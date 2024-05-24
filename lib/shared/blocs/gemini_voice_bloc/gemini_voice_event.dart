part of 'gemini_voice_bloc.dart';

class GeminiVoiceEvent {
  const GeminiVoiceEvent();
}

class VoicePrompt extends GeminiVoiceEvent {
  const VoicePrompt(this.path);
  final String path;
}
