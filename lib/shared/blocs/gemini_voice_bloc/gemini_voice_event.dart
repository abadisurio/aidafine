part of 'gemini_voice_bloc.dart';

class GeminiVoiceEvent {
  const GeminiVoiceEvent();
}

class ToggleShowGenieWidget extends GeminiVoiceEvent {
  const ToggleShowGenieWidget({this.isShown = true});
  final bool isShown;
}

class VoicePrompt extends GeminiVoiceEvent {
  const VoicePrompt(this.path);
  final String path;
}
