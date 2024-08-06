import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'widgets/marble.dart';
// part 'widgets/animated_marble.dart';
// part 'widgets/bubble_input.dart';

@RoutePage<String?>()
class GeniePage extends StatelessWidget {
  const GeniePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _GenieView();
  }
}

class _GenieView extends StatefulWidget {
  const _GenieView();

  @override
  State<_GenieView> createState() => _GenieViewState();
}

class _GenieViewState extends State<_GenieView> {
  // final _recorder = AudioRecorder();
  // final _speechToText = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return const Text('Genie Page');
  }
}
