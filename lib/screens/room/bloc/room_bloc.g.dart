// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomStateImpl _$$RoomStateImplFromJson(Map<String, dynamic> json) =>
    _$RoomStateImpl(
      user: json['user'] == null
          ? null
          : Pilot.fromJson(json['user'] as Map<String, dynamic>),
      chats: (json['chats'] as List<dynamic>?)
              ?.map((e) => Chat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoadingAnswer: json['isLoadingAnswer'] as bool? ?? false,
      isGeneratingAnswer: json['isGeneratingAnswer'] as bool? ?? false,
      answerStreaming: json['answerStreaming'] == null
          ? null
          : Chat.fromJson(json['answerStreaming'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$RoomStateImplToJson(_$RoomStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'chats': instance.chats.map((e) => e.toJson()).toList(),
      'isLoadingAnswer': instance.isLoadingAnswer,
      'isGeneratingAnswer': instance.isGeneratingAnswer,
      'answerStreaming': instance.answerStreaming?.toJson(),
      'errorMessage': instance.errorMessage,
    };
