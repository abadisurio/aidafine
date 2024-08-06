part of 'gemini_voice_bloc.dart';

@freezed
class GeminiVoiceState with _$GeminiVoiceState {
  const factory GeminiVoiceState({
    String? pushNamedRoute,
    Object? data,
    List<String>? recognizedWords,
    Map<String, Object?>? dataMap,
    @Default(false) bool isLoadingAnswer,
    @Default(false) bool showGenieWidget,
    @Default(false) bool showSpokenWords,
    @Default(false) bool isGeneratingAnswer,
    @Default(false) bool isListening,
    @Default(false) bool isReloading,
    String? errorMessage,
  }) = _GeminiVoiceState;

  const GeminiVoiceState._();

  @override
  String toString() {
    return 'GeminiVoiceState recognizedWords $recognizedWords';
  }
}
