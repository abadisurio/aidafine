import 'dart:async';
import 'dart:developer';

import 'dart:math' as math;

import 'package:aidafine/app/themes/text_theme.dart';
import 'package:aidafine/screens/genie/view/widgets/platform/audio_recorder_platform.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:record/record.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'widgets/marble.dart';
part 'widgets/animated_marble.dart';
part 'widgets/bubble_input.dart';

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
  final _recorder = AudioRecorder();
  final _speechToText = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      // appBar: AppBar(),
      body: Stack(
        children: [
          ModalBarrier(
            onDismiss: () {
              context.router.maybePop();
            },
          ),
          // const SafeArea(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Padding(
          //       padding: EdgeInsets.all(16),
          //       child: Text('Tap outside to cancel'),
          //     ),
          //   ),
          // ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _BubbleInput(
                      speechToText: _speechToText,
                    ),
                  ),
                  const SizedBox(width: 16),
                  _AnimatedMarbleVoice(
                    recorder: _recorder,
                    speechToText: _speechToText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
