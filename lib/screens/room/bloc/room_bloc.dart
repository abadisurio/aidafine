// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:aidafine/engine/engine.dart';
// import 'package:firebase_vertexai/firebase_vertexai.dart';
// import 'package:flutter_gemini/flutter_gemini.dart' hide Content;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.g.dart';
part 'room_bloc.freezed.dart';

class RoomBloc extends HydratedBloc<RoomEvent, RoomState> {
  RoomBloc() : super(const RoomState()) {
    on<QueryPrompt>(_onQueryPrompt);
    on<VoicePrompt>(_onVoicePrompt);
    on<InsertChat>(_onInsertChat);
    on<UpdateAnswerGeneration>(_onUpdateAnswerGeneration);
    _initialize();
  }

  // late Gemini _gemini;
  late GenerativeModel _vertexAI;
  ChatSession? _chatSession;
  // AudioRecorder? _recorder;

  Future<void> _initialize() async {
    final key = RemoteConfig.geminiAPIKey;
    try {
      if (key == null) throw Exception('gemini api key not found');
      // _recorder = AudioRecorder();
      // _vertexAI = FirebaseVertexAI.instance.generativeModel(
      //   model: 'gemini-1.5-flash-latest',
      //   tools: [
      //     Tool(functionDeclarations: [_amountTool]),
      //   ],
      //   systemInstruction: Content.system(
      //     'Use Bahasa Indonesia and its localization to interact',
      //   ),
      // );
      _vertexAI = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: key,
        tools: [
          Tool(functionDeclarations: [_amountTool]),
        ],
        systemInstruction: Content.system(
          '''
Use Bahasa Indonesia and its localization to interact.
Answer with only short plaintext.
''',
        ),
      );
      _chatSession = _vertexAI.startChat();
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
        errorMessage: null,
      ),
    );
    // final complete = Completer<void>();

    // ignore: unnecessary_string_interpolations
    final prompt = '''
${event.prompt}''';

    log('prompt $prompt');

    // final prompt2 = [Content.text(prompt)];

    try {
      // Send the message to the generative model.
      if (_chatSession != null) {
        var response = await _chatSession!.sendMessage(Content.text(prompt));

        // final test = await rootBundle.load(path);

        // log('test $test');
        // final fileBytes = await File(path).read;
        // final fileBytes = await File('/assets/audio/coba.mp3').readAsBytes();
        // log('fileBytes $fileBytes');
        // var response = await _chatSession!.sendMessage(
        //   Content.data('audio/m4a', fileBytes),
        // );
        final functionCalls = response.functionCalls.toList();
        log('functionCalls $functionCalls');

        // When the model response with a function call, invoke the function.
        if (functionCalls.isNotEmpty) {
          final functionCall = functionCalls.first;
          log('functionCalls ${functionCall.name}');
          final result = switch (functionCall.name) {
            // Forward arguments to the hypothetical API.
            'findAmount' => await _findAmount(functionCall.args),
            // Throw an exception if the model attempted to call a function that was
            // not declared.
            _ => throw UnimplementedError(
                'Function not implemented: ${functionCall.name}',
              )
          };

          log('result $result');

          // Send the response to the model so that it can use the result to generate
          // text for the user.
          response = await _chatSession!
              .sendMessage(Content.functionResponse(functionCall.name, result));
        }
        // When the model responds with non-null text content, print it.
        log('response.text ${response.text}');
        if (response.text case final text?) {
          log('debug $text');
          add(UpdateAnswerGeneration(text));
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }
      }

// To generate text output, call generateContent with the text input
      // final response = await _vertexAI.generateContent(prompt2);
      // log('response.text ${response.text}');
      // final stream =
      //     _vertexAI.generateContentStream(prompt2).listen((addedValue) async {

      //   if (addedValue.text == null) return;
      //   add(UpdateAnswerGeneration('${addedValue.text}'));
      // })
      //       ..onDone(complete.complete);

      // final stream = _gemini.streamGenerateContent(prompt).listen((addedValue) {
      //   if (addedValue.content?.parts?.last.text == null) return;
      //   add(UpdateAnswerGeneration('${addedValue.content?.parts?.last.text}'));
      // })
      //   ..onDone(complete.complete);

      // await complete.future;
      // await stream.cancel();

      final finalChats = List<Chat>.from(state.chats);

      finalChats[finalChats.length - 1] = state.answerStreaming!;
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          chats: finalChats,
          answerStreaming: null,
        ),
      );
    } catch (e) {
      log('error $e');

      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          answerStreaming: null,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onVoicePrompt(
    VoicePrompt event,
    Emitter<RoomState> emit,
  ) async {
    if (state.isLoadingAnswer) return;

    final newChat = Chat(
      id: 'id',
      username: 'username',
      data: 'Voice',
      createdAt: DateTime.now(),
    );
    emit(
      state.copyWith(
        chats: [...state.chats, newChat],
        isLoadingAnswer: true,
        isGeneratingAnswer: true,
      ),
    );

    final file = File(event.path);
    final fileBytes = await file.readAsBytes();
    try {
      // Send the message to the generative model.
      if (_chatSession != null) {
        var response = await _chatSession!
            .sendMessage(Content.data('audio/m4a', fileBytes));

        final functionCalls = response.functionCalls.toList();

        // When the model response with a function call, invoke the function.
        log('functionCalls $functionCalls');
        if (functionCalls.isNotEmpty) {
          final functionCall = functionCalls.first;
          log('functionCalls ${functionCall.name}');
          final result = switch (functionCall.name) {
            // Forward arguments to the hypothetical API.
            'findAmount' => await _findAmount(functionCall.args),
            // Throw an exception if the model attempted to call a function that was
            // not declared.
            _ => throw UnimplementedError(
                'Function not implemented: ${functionCall.name}',
              )
          };

          log('result $result');

          // Send the response to the model so that it can use the result to generate
          // text for the user.
          response = await _chatSession!
              .sendMessage(Content.functionResponse(functionCall.name, result));
        }
        // When the model responds with non-null text content, print it.
        if (response.text case final text?) {
          log('debug $text');
          add(UpdateAnswerGeneration(text));
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }
      }
      final finalChats = List<Chat>.from(state.chats);

      finalChats[finalChats.length - 1] = state.answerStreaming!;
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          chats: finalChats,
          answerStreaming: null,
        ),
      );
    } catch (e) {
      log('error $e');
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          answerStreaming: null,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onInsertChat(
    InsertChat event,
    Emitter<RoomState> emit,
  ) async {
    emit(
      state.copyWith(
        chats: [...state.chats, event.chat],
        isLoadingAnswer: true,
        isGeneratingAnswer: true,
      ),
    );
    try {
      final finalChats = List<Chat>.from(state.chats);

      finalChats[finalChats.length - 1] = state.answerStreaming!;
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          chats: finalChats,
          answerStreaming: null,
        ),
      );
    } catch (e) {
      log('error $e');
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          answerStreaming: null,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onUpdateAnswerGeneration(
    UpdateAnswerGeneration event,
    Emitter<RoomState> emit,
  ) async {
    log('debug event.addedAnswer 2 ${event.addedAnswer}');
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
            data: '${state.answerStreaming!.data}${event.addedAnswer} ',
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

Future<Map<String, Object?>> _findAmount(
  Map<String, Object?> arguments,
) async {
  return {
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _amountTool = FunctionDeclaration(
  'findAmount',
  'Returns the amount of number mentioned in the sentence',
  Schema(
    SchemaType.object,
    properties: {
      'amount': Schema(
        SchemaType.number,
        description: '''
The number mentioned in the sentence
''',
//  amount total of a number mentioned in the sentence. Detect in Bahasa Indonesia.
      ),
      // 'currencyFrom': Schema(
      //   SchemaType.string,
      //   description: 'The currency code of the currency to convert from, '
      //       'such as "USD".',
      // ),
      // 'currencyTo': Schema(
      //   SchemaType.string,
      //   description: 'The currency code of the currency to convert to, '
      //       'such as "USD".',
      // ),
    },
    requiredProperties: ['amount'],
  ),
);
