import 'package:cloud_firestore/cloud_firestore.dart';

DateTime fromDateTimeJson(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }

  if (value is Timestamp) return value.toDate();

  if (value is DateTime) return value;

  return DateTime.now();
}

Timestamp? toDateTimeJson(dynamic datetime) {
  if (datetime is String && datetime.isNotEmpty) {
    final parsed = DateTime.tryParse(datetime);
    if (parsed == null) return null;
    return Timestamp.fromDate(parsed);
  }

  if (datetime is DateTime) return Timestamp.fromDate(datetime);

  if (datetime is Timestamp) return datetime;

  return null;
}

DateTime getDefaultDateTime() => DateTime.now();
// ActivityType getDefaultPostActivity() => ActivityType.post;
String getDefaultPostId() => '';
