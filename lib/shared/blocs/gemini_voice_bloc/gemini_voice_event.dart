part of 'gemini_voice_bloc.dart';

class GeminiVoiceEvent {
  const GeminiVoiceEvent();
}

class ToggleShowGenieWidget extends GeminiVoiceEvent {
  const ToggleShowGenieWidget({
    this.isShown = true,
    this.isLongPress = false,
    this.showSpokenWords = false,
  });
  final bool isLongPress;
  final bool isShown;
  final bool showSpokenWords;
}

class ProceedPrompt extends GeminiVoiceEvent {
  const ProceedPrompt();
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
