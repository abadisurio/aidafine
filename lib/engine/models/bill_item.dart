import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_item.freezed.dart';
part 'bill_item.g.dart';

@freezed
class BillItem with _$BillItem {
  @JsonSerializable(explicitToJson: true)
  factory BillItem({
    required String id,
    String? name,
    int? quantity,
    int? price,
  }) = _BillItem;

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);
}
