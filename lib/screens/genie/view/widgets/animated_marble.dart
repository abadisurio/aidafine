part of '../genie_page.dart';

class _AnimatedMarbleVoice extends StatefulWidget {
  const _AnimatedMarbleVoice({
    required this.recorder,
    required this.speechToText,
    // ignore: unused_element
    this.onStop,
  });

  final AudioRecorder recorder;
  final SpeechToText speechToText;
  final VoidCallback? onStop;

  @override
  State<_AnimatedMarbleVoice> createState() => _AnimatedMarbleVoiceState();
}

class _AnimatedMarbleVoiceState extends State<_AnimatedMarbleVoice>
    with TickerProviderStateMixin, AudioRecorderMixin {
  // int _recordDuration = 0;
  final _marbles = <Widget>[];
  // bool _isMounted = false;
  // late final Timer _timer;
  StreamSubscription<Amplitude>? _amplitudeSub;
  // StreamSubscription<RecordState>? _recordSub;
  // RecordState _recordState = RecordState.stop;

  @override
  void initState() {
    // _recordSub = widget.recorder.onStateChanged().listen(_updateRecordState);

    _amplitudeSub = widget.recorder
        .onAmplitudeChanged(Durations.medium1)
        .listen((amp) async {
      final decibel = 3.7 - 2 * (math.log(-amp.current) / math.ln10);
      if (decibel > 1) {
        _addMarble();
      }
      if (decibel < -1) {
        await widget.speechToText.stop();
      }
    });
    _start();
    // _timer = Timer.periodic(Durations.short3, (Timer t) async {
    // });
    _addMarble();
    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await widget.recorder.hasPermission()) {
        const encoder = AudioEncoder.aacLc;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }

        final devs = await widget.recorder.listInputDevices();
        debugPrint(devs.toString());

        const config = RecordConfig(
          // ignore: avoid_redundant_argument_values
          encoder: encoder,
          numChannels: 1,
        );

        // Record to file
        await recordFile(widget.recorder, config);

        // // Record to stream
        // await recordStream(_audioRecorder, config);

        // _recordDuration = 0;

        // _startTimer();
      }
    } catch (e) {
      log('$e');
    }
  }

  Future<void> _stop() async {}

  Future<void> _popResult() async {
    // widget.speechToText.lastRecognizedWords;
    final words = widget.speechToText.lastRecognizedWords;
    final path = await widget.recorder.stop();
    if (mounted && path != null) {
      context.read<GeminiVoiceBloc>().add(VoicePrompt(path));
      await context.router.maybePop<String?>(words.isEmpty ? null : words);
    }
  }

  // Future<void> _pause() => widget.recorder.pause();

  // Future<void> _resume() => widget.recorder.resume();

  Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
    final isSupported = await widget.recorder.isEncoderSupported(
      encoder,
    );

    if (!isSupported) {
      debugPrint('${encoder.name} is not supported on this platform.');
      debugPrint('Supported encoders are:');

      for (final e in AudioEncoder.values) {
        if (await widget.recorder.isEncoderSupported(e)) {
          debugPrint('- ${encoder.name}');
        }
      }
    }

    return isSupported;
  }

  void _addMarble() {
    if (mounted) {
      setState(() {
        _marbles.add(const _Marble());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // log('_marbles ${_marbles.length}');
    return GestureDetector(
      onTap: _popResult,
      child: Container(
        width: _Marble.size,
        height: _Marble.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.white,
          border: Border.all(color: Colors.blueAccent, width: 3),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: _marbles,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _animationController.dispose();
    // _timer.cancel();
    _stop();
    _amplitudeSub?.cancel();
    // widget.recorder.dispose();
    super.dispose();
  }
}
