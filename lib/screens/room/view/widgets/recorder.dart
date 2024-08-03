// import 'dart:async';
// import 'dart:developer';
// import 'dart:math' as math;

// import 'package:aidafine/screens/room/view/widgets/platform/audio_recorder_platform.dart';
// import 'package:flutter/material.dart';
// import 'package:record/record.dart';

// class Recorder extends StatefulWidget {
//   const Recorder({required this.onStop, super.key});
//   final void Function(String path) onStop;

//   @override
//   State<Recorder> createState() => _RecorderState();
// }

// class _RecorderState extends State<Recorder> with AudioRecorderMixin {
//   int _recordDuration = 0;
//   Timer? _timer;
//   late final AudioRecorder _audioRecorder;
//   StreamSubscription<RecordState>? _recordSub;
//   RecordState _recordState = RecordState.stop;
//   Widget? _decibelWidget;

//   // Amplitude? _amplitude;

//   @override
//   void initState() {
//     _audioRecorder = AudioRecorder();

//     _recordSub = _audioRecorder.onStateChanged().listen(_updateRecordState);
//     setState(() {
//       _decibelWidget = _DecibleAnimation(
//         recorder: _audioRecorder,
//       );
//     });
//     super.initState();
//   }

//   Future<void> _start() async {
//     try {
//       if (await _audioRecorder.hasPermission()) {
//         const encoder = AudioEncoder.aacLc;

//         if (!await _isEncoderSupported(encoder)) {
//           return;
//         }

//         final devs = await _audioRecorder.listInputDevices();
//         debugPrint(devs.toString());

//         const config = RecordConfig(
//           // ignore: avoid_redundant_argument_values
//           encoder: encoder,
//           numChannels: 1,
//         );

//         // Record to file
//         await recordFile(_audioRecorder, config);

//         // // Record to stream
//         // await recordStream(_audioRecorder, config);

//         _recordDuration = 0;

//         _startTimer();
//       }
//     } catch (e) {
//       log('$e');
//     }
//   }

//   Future<void> _stop() async {
//     final path = await _audioRecorder.stop();

//     if (path != null) {
//       widget.onStop(path);

//       downloadWebData(path);
//     }
//   }

//   // Future<void> _pause() => _audioRecorder.pause();

//   // Future<void> _resume() => _audioRecorder.resume();

//   void _updateRecordState(RecordState recordState) {
//     setState(() => _recordState = recordState);

//     switch (recordState) {
//       case RecordState.pause:
//         _timer?.cancel();
//       case RecordState.record:
//         _startTimer();
//       case RecordState.stop:
//         _timer?.cancel();
//         _recordDuration = 0;
//     }
//   }

//   Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
//     final isSupported = await _audioRecorder.isEncoderSupported(
//       encoder,
//     );

//     if (!isSupported) {
//       debugPrint('${encoder.name} is not supported on this platform.');
//       debugPrint('Supported encoders are:');

//       for (final e in AudioEncoder.values) {
//         if (await _audioRecorder.isEncoderSupported(e)) {
//           debugPrint('- ${encoder.name}');
//         }
//       }
//     }

//     return isSupported;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _buildRecordStopControl(),
//             // const SizedBox(width: 20),
//             // _buildPauseResumeControl(),
//             // const SizedBox(width: 20),
//             // _buildText(),
//           ],
//         ),
//         // if (_amplitude != null) ...[
//         //   const SizedBox(height: 40),
//         //   Text('Current: ${_amplitude?.current ?? 0.0}'),
//         //   Text('Max: ${_amplitude?.max ?? 0.0}'),
//         // ],
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _recordSub?.cancel();
//     // _amplitudeSub?.cancel();
//     _audioRecorder.dispose();
//     super.dispose();
//   }

//   Widget _buildRecordStopControl() {
//     late Icon icon;
//     // late Color color;

//     if (_recordState != RecordState.stop) {
//       icon = const Icon(
//         Icons.stop,
//         color: Colors.red,
//         size: 30,
//         key: Key('stop'),
//       );
//       // color = Colors.white;
//     } else {
//       // final theme = Theme.of(context);
//       icon = const Icon(
//         Icons.mic,
//         color: Colors.white,
//         size: 30,
//         key: Key('play'),
//       );
//       // color = theme.primaryColor.withOpacity(0.1);
//       // color = Colors.transparent;
//     }

//     return ClipOval(
//       child: Material(
//         // color: color,
//         child: InkWell(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (_decibelWidget != null) _decibelWidget!,
//               SizedBox(
//                 width: 56,
//                 height: 56,
//                 child: AnimatedSwitcher(
//                   transitionBuilder: (child, animation) {
//                     return ScaleTransition(scale: animation, child: child);
//                   },
//                   switchInCurve: Curves.easeOut,
//                   switchOutCurve: Curves.easeOut,
//                   duration: const Duration(milliseconds: 200),
//                   child: icon,
//                 ),
//               ),
//             ],
//           ),
//           onTap: () {
//             (_recordState != RecordState.stop) ? _stop() : _start();
//           },
//         ),
//       ),
//     );
//   }

//   // Widget _buildPauseResumeControl() {
//   //   if (_recordState == RecordState.stop) {
//   //     return const SizedBox.shrink();
//   //   }

//   //   late Icon icon;
//   //   late Color color;

//   //   if (_recordState == RecordState.record) {
//   //     icon = const Icon(Icons.pause, color: Colors.red, size: 30);
//   //     color = Colors.red.withOpacity(0.1);
//   //   } else {
//   //     final theme = Theme.of(context);
//   //     icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
//   //     color = theme.primaryColor.withOpacity(0.1);
//   //   }

//   //   return ClipOval(
//   //     child: Material(
//   //       color: color,
//   //       child: InkWell(
//   //         child: SizedBox(width: 56, height: 56, child: icon),
//   //         onTap: () {
//   //           (_recordState == RecordState.pause) ? _resume() : _pause();
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget _buildText() {
//   //   if (_recordState != RecordState.stop) {
//   //     return _buildTimer();
//   //   }

//   //   return const Text('Waiting to record');
//   // }

//   // Widget _buildTimer() {
//   //   final minutes = _formatNumber(_recordDuration ~/ 60);
//   //   final seconds = _formatNumber(_recordDuration % 60);

//   //   return Text(
//   //     '$minutes : $seconds',
//   //     style: const TextStyle(color: Colors.red),
//   //   );
//   // }

//   // String _formatNumber(int number) {
//   //   var numberStr = number.toString();
//   //   if (number < 10) {
//   //     numberStr = '0$numberStr';
//   //   }

//   //   return numberStr;
//   // }

//   void _startTimer() {
//     _timer?.cancel();

//     _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//       setState(() => _recordDuration++);
//     });
//   }
// }

// class _DecibleAnimation extends StatefulWidget {
//   const _DecibleAnimation({required this.recorder});

//   final AudioRecorder recorder;

//   @override
//   State<_DecibleAnimation> createState() => _DecibleAnimationState();
// }

// class _DecibleAnimationState extends State<_DecibleAnimation> {
//   StreamSubscription<Amplitude>? _amplitudeSub;
//   double _decibel = 0;

//   @override
//   void initState() {
//     _amplitudeSub = widget.recorder
//         .onAmplitudeChanged(const Duration(milliseconds: 20))
//         .listen((amp) {
//       final db = 3.7 - 2 * (math.log(-amp.current) / math.ln10);
//       setState(() => _decibel = db * 10);
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: AnimatedContainer(
//         duration: Durations.short1,
//         curve: Curves.easeIn,
//         height: _decibel,
//         width: _decibel,
//         color: Colors.red,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _amplitudeSub?.cancel();
//     super.dispose();
//   }
// }
