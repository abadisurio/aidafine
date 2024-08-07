part of 'bill_summarizer_bloc.dart';

@freezed
class BillSummarizerState with _$BillSummarizerState {
  const factory BillSummarizerState({
    required DateTime createdAt,
    required BillSummary billSummary,
    DateTime? modifiedAt,
    @Default(false) bool isGeneratingAnswer,
    String? errorMessage,
  }) = _BillSummarizerState;

  // factory BillSummarizerState.fromJson(Map<String, dynamic> json) =>
  //     _$BillSummarizerStateFromJson(json);

  const BillSummarizerState._();
}
