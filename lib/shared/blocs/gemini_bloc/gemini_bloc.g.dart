// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeminiStateImpl _$$GeminiStateImplFromJson(Map<String, dynamic> json) =>
    _$GeminiStateImpl(
      pushNamedRoute: json['push_named_route'] as String?,
      data: json['data'],
      dataMap: json['data_map'] as Map<String, dynamic>?,
      isLoadingAnswer: json['is_loading_answer'] as bool? ?? false,
      isGeneratingAnswer: json['is_generating_answer'] as bool? ?? false,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$$GeminiStateImplToJson(_$GeminiStateImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('push_named_route', instance.pushNamedRoute);
  writeNotNull('data', instance.data);
  writeNotNull('data_map', instance.dataMap);
  val['is_loading_answer'] = instance.isLoadingAnswer;
  val['is_generating_answer'] = instance.isGeneratingAnswer;
  writeNotNull('error_message', instance.errorMessage);
  return val;
}
