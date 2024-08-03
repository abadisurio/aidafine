import 'dart:async';
import 'dart:developer';

import 'package:aidafine/app/themes/text_theme.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// import 'package:record/record.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'widgets/marble.dart';
// part 'widgets/animated_marble.dart';
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
  // final _recorder = AudioRecorder();
  // final _speechToText = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        // Align(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         const Text('text'),
        //         // Expanded(
        //         //   child: _BubbleInput(
        //         //     speechToText: _speechToText,
        //         //   ),
        //         // ),
        //         // const SizedBox(width: 16),
        //         // _AnimatedMarbleVoice(
        //         //   recorder: _recorder,
        //         //   speechToText: _speechToText,
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                // color: Colors.grey.shade800,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text('✨'),
                      SizedBox(width: 8),
                      Text('Listening'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
