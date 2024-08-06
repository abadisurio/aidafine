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

class UpdateRecognizedWords extends GeminiVoiceEvent {
  const UpdateRecognizedWords(this.recognizedWords);
  final List<String> recognizedWords;
}

class ReloadVoiceListener extends GeminiVoiceEvent {
  const ReloadVoiceListener({this.isReloading = false});

  final bool isReloading;
}

class ListenDebouncer extends GeminiVoiceEvent {
  const ListenDebouncer({this.isListening = false});

  final bool isListening;
}
