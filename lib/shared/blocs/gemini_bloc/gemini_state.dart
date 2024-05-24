part of 'gemini_bloc.dart';

@freezed
class GeminiState with _$GeminiState {
  @JsonSerializable(explicitToJson: true)
  const factory GeminiState({
    String? pushNamedRoute,
    Object? data,
    Map<String, Object?>? dataMap,
    @Default(false) bool isLoadingAnswer,
    @Default(false) bool isGeneratingAnswer,
    String? errorMessage,
  }) = _GeminiState;

  factory GeminiState.fromJson(Map<String, dynamic> json) =>
      _$GeminiStateFromJson(json);

  const GeminiState._();
}
