// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';

import 'package:aidafine/engine/engine.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.g.dart';
part 'room_bloc.freezed.dart';

class RoomBloc extends HydratedBloc<RoomEvent, RoomState> {
  RoomBloc() : super(const RoomState()) {
    on<QueryPrompt>(_onQueryPrompt);
    on<UpdateAnswerGeneration>(_onUpdateAnswerGeneration);
    _initialize();
  }

  late Gemini _gemini;

  void _initialize() {
    log('debug loaddd');
    final key = RemoteConfig.geminiAPIKey;
    log('debug key $key');
    try {
      if (key == null) throw Exception('gemini api key not found');
      _gemini = Gemini.init(apiKey: key);
    } catch (e) {
      log('error $e');
    }
  }

  Future<void> _onQueryPrompt(
    QueryPrompt event,
    Emitter<RoomState> emit,
  ) async {
    if (state.isLoadingAnswer) return;
    final newChat = Chat(
      id: 'id',
      username: 'username',
      data: event.prompt,
      createdAt: DateTime.now(),
    );
    emit(
      state.copyWith(
        chats: [...state.chats, newChat],
        isLoadingAnswer: true,
        isGeneratingAnswer: true,
      ),
    );
    final complete = Completer<void>();

    final prompt = '''
${event.prompt}, make the answer in short sentence and friendly''';

    final stream = _gemini.streamGenerateContent(prompt).listen((addedValue) {
      // log('value.output ${addedValue.output}');
      if (addedValue.output == null) return;
      // log('debug state.answerStreaming ${state.answerStreaming == null}');
      // if (state.answerStreaming == null) {
      //   final newAnswer = Chat(
      //     id: 'id',
      //     username: 'gemini',
      //     data: '${addedValue.output}',
      //     createdAt: DateTime.now(),
      //   );
      //   add(UpdateAnswerGeneration(newAnswer));
      // } else {
      //   final updatedAnswer = state.answerStreaming!.copyWith(
      //     data: '${state.answerStreaming!.data}${addedValue.output}',
      //   );
      // }
      add(UpdateAnswerGeneration('${addedValue.output}'));
    })
      ..onDone(complete.complete);

    await complete.future;
    await stream.cancel();
    // final newAnswer = Chat(
    //   id: 'id',
    //   username: 'gemini',
    //   data: '${state.answerStreaming}',
    //   createdAt: DateTime.now(),
    // );
    // log('newAnswer $newAnswer');
    final finalChats = List<Chat>.from(state.chats);

    log('debug state.answerStreaming ${state.answerStreaming}');
    finalChats[finalChats.length - 1] = state.answerStreaming!;
    emit(
      state.copyWith(
        isLoadingAnswer: false,
        isGeneratingAnswer: false,
        chats: finalChats,
        answerStreaming: null,
      ),
    );
    log('debug finalChats.last ${state.answerStreaming == null && !state.isGeneratingAnswer} ${state.chats.last}');
  }

  Future<void> _onUpdateAnswerGeneration(
    UpdateAnswerGeneration event,
    Emitter<RoomState> emit,
  ) async {
    // log('debug state.answerStreaming 2 ${state.answerStreaming}');
    // log('debug event.answer 2 ${event.answer.data} ');
    // log('debug bikin chat baru: ${state.answerStreaming == null}');
    if (state.answerStreaming == null) {
      final newAnswer = Chat(
        id: 'id',
        username: 'gemini',
        data: event.addedAnswer,
        createdAt: DateTime.now(),
      );
      emit(
        state.copyWith(
          answerStreaming: newAnswer,
          chats: [...state.chats, newAnswer],
        ),
      );
    } else {
      emit(
        state.copyWith(
          answerStreaming: state.answerStreaming!.copyWith(
            data: '${state.answerStreaming!.data}${event.addedAnswer}',
          ),
        ),
      );
    }
    // log('debug state.chats.last ${state.chats.length} ${state.chats.last.data}');
  }

  @override
  RoomState? fromJson(Map<String, dynamic> json) {
    return null;
    // return RoomState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(RoomState state) {
    // return null;
    return state.toJson();
  }
}
