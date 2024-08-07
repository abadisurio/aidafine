// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/router/aidafine_router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:rxdart/rxdart.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'gemini_voice_event.dart';
part 'gemini_voice_state.dart';
part 'gemini_voice_tools.dart';
part 'gemini_voice_bloc.freezed.dart';

class GeminiVoiceBloc extends Bloc<GeminiVoiceEvent, GeminiVoiceState> {
  GeminiVoiceBloc() : super(const GeminiVoiceState()) {
    on<VoicePrompt>(_onVoicePrompt);
    on<ToggleShowGenieWidget>(_onToggleShowGenieWidget);
    on<UpdateRecognizedWords>(_onUpdateRecognizedWords);
    on<ReloadVoiceListener>(_onReloadVoiceListener);
    on<ListenDebouncer>(
      _onListenDebouncer,
      transformer: (events, mapper) =>
          events.debounceTime(const Duration(seconds: 3)).switchMap(mapper),
    );
    _initialize();
  }

  late GenerativeModel _vertexAI;
  late ChatSession _chatSession;
  late SpeechToText _speechToText;
  bool _speechEnabled = false;

  List<String> _existingWords = [];

  Future<void> _initialize() async {
    final key = RemoteConfig.geminiAPIKey;
    _speechToText = SpeechToText();

    try {
      if (key == null) throw Exception('gemini api key not found');
      _vertexAI = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: key,
        tools: [
          Tool(
            functionDeclarations: [
              // _payWithOnlineTool,
              _payWithQRISTool,
              // _transferTool,
              _summarizingOrderTool,
            ],
          ),
        ],
        systemInstruction: _contentSystemInstruction,
      );
      _chatSession = _vertexAI.startChat();
    } catch (e) {
      log('error $e');
    }
  }

  void _onToggleShowGenieWidget(
    ToggleShowGenieWidget event,
    Emitter<GeminiVoiceState> emit,
  ) {
    emit(
      state.copyWith(
        showGenieWidget: event.isShown,
        isListening: event.isShown,
        recognizedWords: null,
        response: null,
        showSpokenWords: event.showSpokenWords,
      ),
    );
    if (event.isShown) {
      HapticFeedback.heavyImpact();
      _startListening();
    } else {
      _stopListening();
      _existingWords = [];
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

    GenieRespose<dynamic>? response;
    // Map<String, Object?>? dataMap;

    try {
      final geminiResponse =
          await _chatSession.sendMessage(Content.text(event.spokenWords));

      final functionCalls = geminiResponse.functionCalls.toList();

      // When the model geminiResponse with a function call, invoke the function.
      log('functionCalls $functionCalls');
      if (functionCalls.isNotEmpty) {
        final functionCall = functionCalls.first;
        // for (final functionCall in functionCalls) {
        log('functionName ${functionCall.name}');
        log('functionArgs ${functionCall.args}');
        final result = switch (functionCall.name) {
          'payWithQRIS' => await _payWithQRIS(functionCall.args),
          'payWithOnline' => await _payWithOnline(functionCall.args),
          'transfer' => await _transfer(functionCall.args),
          'summarizingOrder' => await _summarizingOrder(functionCall.args),
          _ => throw UnimplementedError(
              'Function not implemented: ${functionCall.name}',
            )
        };

        log('result $result');

        if (functionCall.name == 'summarizingOrder') {
          response = result as GenieRespose<BillSummary>?;
        }
        // }
      }

      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          response: response,
        ),
      );
    } catch (e) {
      log('error 2 $e');
      emit(
        state.copyWith(
          isLoadingAnswer: false,
          isGeneratingAnswer: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onUpdateRecognizedWords(
    UpdateRecognizedWords event,
    Emitter<GeminiVoiceState> emit,
  ) {
    emit(
      state.copyWith(
        recognizedWords: [
          ..._existingWords,
          ...event.recognizedWords,
        ],
      ),
    );
  }

  Future<void> _onReloadVoiceListener(
    ReloadVoiceListener event,
    Emitter<GeminiVoiceState> emit,
  ) async {
    _existingWords = state.recognizedWords ?? <String>[];
    emit(
      state.copyWith(
        isReloading: true,
        recognizedWords: _existingWords,
      ),
    );
    await _stopListening();
    await Future<void>.delayed(Durations.long2);
    await _startListening();
    if (_speechEnabled) {
      log('debug _speechEnabled $_speechEnabled');
    }
    emit(state.copyWith(isReloading: false));
  }

  void _onListenDebouncer(
    ListenDebouncer event,
    Emitter<GeminiVoiceState> emit,
  ) {
    if (!event.isListening) {
      add(VoicePrompt(spokenWords: _existingWords.join(' ')));
      _stopListening();
      // add(const ToggleShowGenieWidget(isShown: false));
    }
  }

  Future<void> _startListening() async {
    // final locales = await _speechToText.locales();
    // for (final element in locales) {
    //   log('locales ${element.localeId} ${element.name}');
    // }
    add(const ListenDebouncer());
    _speechEnabled = await _speechToText.initialize();
    try {
      unawaited(
        _speechToText.listen(
          listenFor: const Duration(minutes: 5),
          // pauseFor: const Duration(minutes: 1),
          localeId: 'id-ID',
          onResult: _onSpeechResult,
          listenOptions: SpeechListenOptions(
            // onDevice: true,
            listenMode: ListenMode.dictation,
          ),
          onSoundLevelChange: (level) {
            // log('debug level $level');
          },
        ),
      );
    } on ListenFailedException catch (e) {
      log('ListenFailedException: ${e.details} ${e.message}');
    }
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
    await _speechToText.stop();
    _speechEnabled = false;
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
    final recognizedWords = result.recognizedWords.split(' ');
    // if (_existingWords.isNotEmpty) {
    //   recognizedWords.insertAll(0, _existingWords);
    // }
    // log('debug debouncing ${_speechToText.isListening}');
    add(const ListenDebouncer());
    if (_speechToText.isListening) {
      add(UpdateRecognizedWords(recognizedWords));
    } else {
      add(const ReloadVoiceListener());
    }
  }
}
