// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillSummaryImpl _$$BillSummaryImplFromJson(Map<String, dynamic> json) =>
    _$BillSummaryImpl(
      id: json['id'] as String,
      billItems: (json['bill_items'] as List<dynamic>?)
              ?.map((e) => BillItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      grandTotal: (json['grand_total'] as num?)?.toInt(),
      additionalCharges:
          (json['additional_charges'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num?)?.toInt()),
      ),
    );

Map<String, dynamic> _$$BillSummaryImplToJson(_$BillSummaryImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'bill_items': instance.billItems.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grand_total', instance.grandTotal);
  writeNotNull('additional_charges', instance.additionalCharges);
  return val;
}
