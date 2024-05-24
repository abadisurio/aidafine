// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';
import 'dart:io';

import 'package:aidafine/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';
part 'gemini_bloc.freezed.dart';
part 'gemini_bloc.g.dart';

class GeminiVoiceBloc extends Bloc<GeminiEvent, GeminiVoiceState> {
  GeminiVoiceBloc() : super(const GeminiVoiceState()) {
    on<VoicePrompt>(_onVoicePrompt);
    _initialize();
  }

  late GenerativeModel _vertexAI;
  late ChatSession _chatSession;

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
          Tool(
            functionDeclarations: [
              _payWithOnlineTool,
              _payWithQRISTool,
              _transferTool,
            ],
          ),
        ],
        systemInstruction: Content.system(
          '''
Listen for the user intent when making a transaction within the app.
Is it want to pay, tranfer, or seeing the balance.
They're likely using bahasa indonesia.
''',
        ),
      );
      _chatSession = _vertexAI.startChat();
    } catch (e) {
      log('error $e');
    }
  }

  Future<void> _onVoicePrompt(
    VoicePrompt event,
    Emitter<GeminiVoiceState> emit,
  ) async {
    if (state.isLoadingAnswer) return;

    emit(
      state.copyWith(
        isLoadingAnswer: true,
        isGeneratingAnswer: true,
      ),
    );

    String? pushNamedRoute;
    Object? data;
    Map<String, Object?>? dataMap;

    final file = File(event.path);
    final fileBytes = await file.readAsBytes();
    try {
      var response =
          await _chatSession.sendMessage(Content.data('audio/m4a', fileBytes));

      final functionCalls = response.functionCalls.toList();

      // When the model response with a function call, invoke the function.
      log('functionCalls $functionCalls');
      if (functionCalls.isNotEmpty) {
        final functionCall = functionCalls.first;
        log('functionCalls ${functionCall.name}');
        final result = switch (functionCall.name) {
          'payWithQRIS' => await payWithQRIS(functionCall.args),
          'payWithOnline' => await payWithOnline(functionCall.args),
          'transfer' => await transfer(functionCall.args),
          _ => throw UnimplementedError(
              'Function not implemented: ${functionCall.name}',
            )
        };

        log('result $result');

        if (functionCall.name == 'payWithQRIS') {
          pushNamedRoute = 'QRISRoute';
          data = result['amount'];
        }

        response = await _chatSession
            .sendMessage(Content.functionResponse(functionCall.name, result));
      }

      if (response.text case final text?) {
        log('debug $text');
        // add(UpdateAnswerGeneration(text));
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }

      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          pushNamedRoute: pushNamedRoute,
          data: data,
          dataMap: dataMap,
        ),
      );
    } catch (e) {
      log('error $e');
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

Future<Map<String, Object?>> payWithQRIS(
  Map<String, Object?> arguments,
) async {
  return {
    'isPayingWithQRIS': arguments['isPayingWithQRIS'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _payWithQRISTool = FunctionDeclaration(
  'payWithQRIS',
  'Check if a user wants to pay with QRIS with or without mentioned amount',
  Schema(
    SchemaType.object,
    properties: {
      'isPayingWithQRIS': Schema(
        SchemaType.boolean,
        description: '''Is the user wants to pay with QRIS?''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isPayingWithQRIS'],
  ),
);
Future<Map<String, Object?>> transfer(
  Map<String, Object?> arguments,
) async {
  return {
    'isInitiatingTransfer': arguments['isInitiatingTransfer'],
    'name': arguments['name'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _transferTool = FunctionDeclaration(
  'transfer',
  'Check if a user wants to pay with QRIS with or without mentioned amount',
  Schema(
    SchemaType.object,
    properties: {
      'isInitiatingTransfer': Schema(
        SchemaType.boolean,
        description: '''Is the user wants to make a transfer with someone''',
      ),
      'name': Schema(
        SchemaType.string,
        description: '''The name of the person mentioned in the sentence''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isPayingWithQRIS', 'name'],
  ),
);
Future<Map<String, Object?>> payWithOnline(
  Map<String, Object?> arguments,
) async {
  return {
    'isOnlinePaying': arguments['isOnlinePaying'],
    'channel': arguments['channel'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _payWithOnlineTool = FunctionDeclaration(
  'payWithOnline',
  'Check if a user wants to pay with online payment through indonesian bills with or without mentioned amount',
  Schema(
    SchemaType.object,
    properties: {
      'isOnlinePaying': Schema(
        SchemaType.boolean,
        description:
            '''Is the user wants to make a payment with built in channels for online payment bills''',
      ),
      'channel': Schema(
        SchemaType.string,
        description: '''The name of the channel mentioned in the sentence''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isOnlinePaying', 'channel'],
  ),
);
