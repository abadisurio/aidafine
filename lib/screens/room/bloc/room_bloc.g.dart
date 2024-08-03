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
      isLoadingAnswer: json['is_loading_answer'] as bool? ?? false,
      isGeneratingAnswer: json['is_generating_answer'] as bool? ?? false,
      answerStreaming: json['answer_streaming'] == null
          ? null
          : Chat.fromJson(json['answer_streaming'] as Map<String, dynamic>),
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$$RoomStateImplToJson(_$RoomStateImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  val['chats'] = instance.chats.map((e) => e.toJson()).toList();
  val['is_loading_answer'] = instance.isLoadingAnswer;
  val['is_generating_answer'] = instance.isGeneratingAnswer;
  writeNotNull('answer_streaming', instance.answerStreaming?.toJson());
  writeNotNull('error_message', instance.errorMessage);
  return val;
}
