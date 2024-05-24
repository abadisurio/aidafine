import 'dart:async';
import 'dart:developer';

import 'package:aidafine/shared/widgets/platform/audio_recorder_platform.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class GeminiVoiceButton extends StatefulWidget {
  const GeminiVoiceButton({
    required this.onStop,
    required this.button,
    super.key,
  });
  final void Function(String path) onStop;
  final Widget button;
  @override
  State<GeminiVoiceButton> createState() => _GeminiVoiceButtonState();
}

class _GeminiVoiceButtonState extends State<GeminiVoiceButton>
    with AudioRecorderMixin {
  int _recordDuration = 0;
  Timer? _timer;
  late final AudioRecorder _audioRecorder;
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  // Amplitude? _amplitude;

  @override
  void initState() {
    _audioRecorder = AudioRecorder();

    _recordSub = _audioRecorder.onStateChanged().listen(_updateRecordState);

    // _amplitudeSub = _audioRecorder
    //     .onAmplitudeChanged(const Duration(milliseconds: 300))
    //     .listen((amp) {
    //   log('amp $amp');
    //   setState(() => _amplitude = amp);
    // });

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        const encoder = AudioEncoder.aacLc;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }

        final devs = await _audioRecorder.listInputDevices();
        debugPrint(devs.toString());

        const config = RecordConfig(
          // ignore: avoid_redundant_argument_values
          encoder: encoder,
          numChannels: 1,
        );

        log('record');

        // Record to file
        await recordFile(_audioRecorder, config);

        // // Record to stream
        // await recordStream(_audioRecorder, config);

        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      log('$e');
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);

      downloadWebData(path);
    }
  }

  // Future<void> _pause() => _audioRecorder.pause();

  // Future<void> _resume() => _audioRecorder.resume();

  void _updateRecordState(RecordState recordState) {
    setState(() => _recordState = recordState);

    switch (recordState) {
      case RecordState.pause:
        _timer?.cancel();
      case RecordState.record:
        _startTimer();
      case RecordState.stop:
        _timer?.cancel();
        _recordDuration = 0;
    }
  }

  Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
    final isSupported = await _audioRecorder.isEncoderSupported(
      encoder,
    );

    if (!isSupported) {
      debugPrint('${encoder.name} is not supported on this platform.');
      debugPrint('Supported encoders are:');

      for (final e in AudioEncoder.values) {
        if (await _audioRecorder.isEncoderSupported(e)) {
          debugPrint('- ${encoder.name}');
        }
      }
    }

    return isSupported;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildRecordStopControl(),
          ],
        ),
        // if (_amplitude != null) ...[
        //   const SizedBox(height: 40),
        //   Text('Current: ${_amplitude?.current ?? 0.0}'),
        //   Text('Max: ${_amplitude?.max ?? 0.0}'),
        // ],
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    return GestureDetector(
      onLongPress: _start,
      onLongPressUp: () {
        if (_recordState != RecordState.stop) {
          _stop();
        }
      },
      child: widget.button,
    );
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
