// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeminiStateImpl _$$GeminiStateImplFromJson(Map<String, dynamic> json) =>
    _$GeminiStateImpl(
      pushNamedRoute: json['pushNamedRoute'] as String?,
      data: json['data'],
      dataMap: json['dataMap'] as Map<String, dynamic>?,
      isLoadingAnswer: json['isLoadingAnswer'] as bool? ?? false,
      isGeneratingAnswer: json['isGeneratingAnswer'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$GeminiStateImplToJson(_$GeminiStateImpl instance) =>
    <String, dynamic>{
      'pushNamedRoute': instance.pushNamedRoute,
      'data': instance.data,
      'dataMap': instance.dataMap,
      'isLoadingAnswer': instance.isLoadingAnswer,
      'isGeneratingAnswer': instance.isGeneratingAnswer,
      'errorMessage': instance.errorMessage,
    };
