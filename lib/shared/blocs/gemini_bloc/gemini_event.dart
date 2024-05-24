part of 'gemini_bloc.dart';

class GeminiEvent {
  const GeminiEvent();
}

class Prompt extends GeminiEvent {
  const Prompt(this.prompt);
  final String prompt;
}
