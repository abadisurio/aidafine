// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomState _$RoomStateFromJson(Map<String, dynamic> json) {
  return _RoomState.fromJson(json);
}

/// @nodoc
mixin _$RoomState {
  Pilot? get user => throw _privateConstructorUsedError;
  List<Chat> get chats => throw _privateConstructorUsedError;
  bool get isLoadingAnswer => throw _privateConstructorUsedError;
  bool get isGeneratingAnswer => throw _privateConstructorUsedError;
  Chat? get answerStreaming => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res, RoomState>;
  @useResult
  $Res call(
      {Pilot? user,
      List<Chat> chats,
      bool isLoadingAnswer,
      bool isGeneratingAnswer,
      Chat? answerStreaming});

  $PilotCopyWith<$Res>? get user;
  $ChatCopyWith<$Res>? get answerStreaming;
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res, $Val extends RoomState>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? chats = null,
    Object? isLoadingAnswer = null,
    Object? isGeneratingAnswer = null,
    Object? answerStreaming = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Pilot?,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      answerStreaming: freezed == answerStreaming
          ? _value.answerStreaming
          : answerStreaming // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PilotCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $PilotCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res>? get answerStreaming {
    if (_value.answerStreaming == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.answerStreaming!, (value) {
      return _then(_value.copyWith(answerStreaming: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomStateImplCopyWith<$Res>
    implements $RoomStateCopyWith<$Res> {
  factory _$$RoomStateImplCopyWith(
          _$RoomStateImpl value, $Res Function(_$RoomStateImpl) then) =
      __$$RoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Pilot? user,
      List<Chat> chats,
      bool isLoadingAnswer,
      bool isGeneratingAnswer,
      Chat? answerStreaming});

  @override
  $PilotCopyWith<$Res>? get user;
  @override
  $ChatCopyWith<$Res>? get answerStreaming;
}

/// @nodoc
class __$$RoomStateImplCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$RoomStateImpl>
    implements _$$RoomStateImplCopyWith<$Res> {
  __$$RoomStateImplCopyWithImpl(
      _$RoomStateImpl _value, $Res Function(_$RoomStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? chats = null,
    Object? isLoadingAnswer = null,
    Object? isGeneratingAnswer = null,
    Object? answerStreaming = freezed,
  }) {
    return _then(_$RoomStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Pilot?,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      isLoadingAnswer: null == isLoadingAnswer
          ? _value.isLoadingAnswer
          : isLoadingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingAnswer: null == isGeneratingAnswer
          ? _value.isGeneratingAnswer
          : isGeneratingAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      answerStreaming: freezed == answerStreaming
          ? _value.answerStreaming
          : answerStreaming // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoomStateImpl extends _RoomState {
  const _$RoomStateImpl(
      {this.user,
      final List<Chat> chats = const [],
      this.isLoadingAnswer = false,
      this.isGeneratingAnswer = false,
      this.answerStreaming})
      : _chats = chats,
        super._();

  factory _$RoomStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomStateImplFromJson(json);

  @override
  final Pilot? user;
  final List<Chat> _chats;
  @override
  @JsonKey()
  List<Chat> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  @JsonKey()
  final bool isLoadingAnswer;
  @override
  @JsonKey()
  final bool isGeneratingAnswer;
  @override
  final Chat? answerStreaming;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.isLoadingAnswer, isLoadingAnswer) ||
                other.isLoadingAnswer == isLoadingAnswer) &&
            (identical(other.isGeneratingAnswer, isGeneratingAnswer) ||
                other.isGeneratingAnswer == isGeneratingAnswer) &&
            (identical(other.answerStreaming, answerStreaming) ||
                other.answerStreaming == answerStreaming));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_chats),
      isLoadingAnswer,
      isGeneratingAnswer,
      answerStreaming);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      __$$RoomStateImplCopyWithImpl<_$RoomStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomStateImplToJson(
      this,
    );
  }
}

abstract class _RoomState extends RoomState {
  const factory _RoomState(
      {final Pilot? user,
      final List<Chat> chats,
      final bool isLoadingAnswer,
      final bool isGeneratingAnswer,
      final Chat? answerStreaming}) = _$RoomStateImpl;
  const _RoomState._() : super._();

  factory _RoomState.fromJson(Map<String, dynamic> json) =
      _$RoomStateImpl.fromJson;

  @override
  Pilot? get user;
  @override
  List<Chat> get chats;
  @override
  bool get isLoadingAnswer;
  @override
  bool get isGeneratingAnswer;
  @override
  Chat? get answerStreaming;
  @override
  @JsonKey(ignore: true)
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
