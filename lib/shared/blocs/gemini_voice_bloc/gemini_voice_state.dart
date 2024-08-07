part of 'gemini_voice_bloc.dart';

@freezed
class GeminiVoiceState with _$GeminiVoiceState {
  const factory GeminiVoiceState({
    List<String>? recognizedWords,
    GenieRespose<dynamic>? response,
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

@freezed
class GenieRespose<T> with _$GenieRespose<T> {
  const factory GenieRespose({
    T? data,
    String? pushNamedRoute,
    String? message,
    // Map<String, Object?>? dataMap,
    String? errorMessage,
  }) = _GenieRespose;

  // const GenieRespose._();

  // @override
  // String toString() {
  //   return 'GenieRespose recognizedWords $data';
  // }
}
