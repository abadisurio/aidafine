part of 'gemini_voice_bloc.dart';

@freezed
class GeminiVoiceState with _$GeminiVoiceState {
  const factory GeminiVoiceState({
    String? pushNamedRoute,
    Object? data,
    Map<String, Object?>? dataMap,
    @Default(false) bool isLoadingAnswer,
    @Default(false) bool showGenieWidget,
    @Default(false) bool isGeneratingAnswer,
    String? errorMessage,
  }) = _GeminiVoiceState;

  const GeminiVoiceState._();
}
