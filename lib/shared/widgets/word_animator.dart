import 'package:flutter/material.dart';

class WordAnimator extends StatefulWidget {
  const WordAnimator({required this.word, super.key});

  final String word;

  @override
  State<WordAnimator> createState() => __WordAnimatorState();
}

class __WordAnimatorState extends State<WordAnimator> {
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
      duration: const Duration(milliseconds: 250),
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
