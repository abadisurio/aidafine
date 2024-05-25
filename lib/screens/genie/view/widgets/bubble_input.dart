part of '../genie_page.dart';

class _BubbleInput extends StatefulWidget {
  const _BubbleInput({required this.speechToText});
  final SpeechToText speechToText;
  @override
  State<_BubbleInput> createState() => _BubbleInputState();
}

class _BubbleInputState extends State<_BubbleInput> {
  late final _speechToText = widget.speechToText;
  List<String> _words = [];
  bool _isListening = false;
  bool _speechEnabled = false;

  @override
  void initState() {
    super.initState();
    Future(() async {
      await _initSpeech();
      if (_speechEnabled) {
        await _startListening();
      }
    });
  }

  /// This has to happen only once per app
  Future<void> _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    // final locales = await _speechToText.locales();
    // for (final element in locales) {
    //   log('locales ${element.localeId} ${element.name}');
    // }

    await _speechToText.listen(
      // localeId: 'id-ID',
      onResult: _onSpeechResult,
      listenOptions: SpeechListenOptions(
        onDevice: true,
        listenMode: ListenMode.search,
      ),
    );

    _isListening = _speechToText.isListening;
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
    await _speechToText.stop();
    if (mounted) {
      setState(() {
        _isListening = _speechToText.isListening;
      });
    }
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    final recognizedWords = result.recognizedWords.split(' ');
    if (mounted) {
      setState(() {
        _words = recognizedWords;
      });
    }
  }

  late final _emptyText = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Mulai bicara',
        style: TextStyleTheme(context).titleLarge,
      ),
      Text(
        'Ketuk di luar untuk membatalkan',
        style: TextStyleTheme(context).labelMedium,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    log('debug _isListening $_isListening');
    // log('debug _words $_words ');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            AnimatedCrossFade(
              duration: Durations.medium4,
              sizeCurve: Curves.easeOutCirc,
              // alignment: Alignment.center,
              firstChild: const SizedBox.shrink(),
              secondChild: _emptyText,
              crossFadeState: _words.isNotEmpty
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            for (var i = 0; i < _words.length; i++)
              _WordAnimator(
                word: _words[i],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stopListening();
    _speechToText.cancel();
    super.dispose();
  }
}

class _WordAnimator extends StatefulWidget {
  const _WordAnimator({required this.word});

  final String word;

  @override
  State<_WordAnimator> createState() => __WordAnimatorState();
}

class __WordAnimatorState extends State<_WordAnimator> {
  bool _isMounted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isMounted = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.bottomLeft,
      duration: const Duration(milliseconds: 500),
      sizeCurve: Curves.easeOutCirc,
      crossFadeState:
          _isMounted ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: const SizedBox.shrink(),
      secondChild: Text(
        '${widget.word} ',
        style: const TextStyle(
          fontSize: 18,
          // fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
