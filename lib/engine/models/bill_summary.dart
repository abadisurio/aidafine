import 'package:aidafine/engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_summary.freezed.dart';
part 'bill_summary.g.dart';

@freezed
class BillSummary with _$BillSummary {
  @JsonSerializable(explicitToJson: true)
  factory BillSummary({
    required String id,
    @Default([]) List<BillItem> billItems,
    int? grandTotal,
    Map<String, int?>? additionalCharges,
  }) = _BillSummary;

  factory BillSummary.fromJson(Map<String, dynamic> json) =>
      _$BillSummaryFromJson(json);
}
