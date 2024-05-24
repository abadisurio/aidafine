part of 'gemini_voice_bloc.dart';

@freezed
class GeminiVoiceState with _$GeminiVoiceState {
  @JsonSerializable(explicitToJson: true)
  const factory GeminiVoiceState({
    String? pushNamedRoute,
    Object? data,
    Map<String, Object?>? dataMap,
    @Default(false) bool isLoadingAnswer,
    @Default(false) bool isGeneratingAnswer,
    String? errorMessage,
  }) = _GeminiVoiceState;

  factory GeminiVoiceState.fromJson(Map<String, dynamic> json) =>
      _$GeminiVoiceStateFromJson(json);

  const GeminiVoiceState._();
}
