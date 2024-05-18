import 'dart:async';
import 'dart:developer';

import 'package:aidafine/app/themes/text_theme.dart';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/screens/room/view/widgets/bubble_carousel.dart';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class BubbleAnswer extends StatelessWidget {
  const BubbleAnswer({
    required this.chat,
    super.key,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topLeft,
      curve: Curves.easeOutCirc,
      clipBehavior: Clip.antiAlias,
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MarkdownBody(
              // extensionSet: md.ExtensionSet(
              //   md.ExtensionSet.gitHubFlavored.blockSyntaxes,
              //   <md.InlineSyntax>[
              //     md.EmojiSyntax(),
              //     ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
              //   ],
              // ),
              data: chat.data,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                textAlign: WrapAlignment.start,
                p: TextStyleTheme(context).bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.blue.shade800
                          : Colors.blue.shade200,
                    ),
              ),
              // builders: {
              //   'p': ParagraphElementBuilder(),
              // },
            ),
          ),
          const SizedBox(height: 8),
          if (chat.catalogs != null && chat.catalogs!.isNotEmpty)
            BubbleCarousel(catalogs: chat.catalogs!),
        ],
      ),
    );
  }
}

class _TextAnimator extends StatefulWidget {
  const _TextAnimator({required this.data});

  final String data;

  @override
  State<_TextAnimator> createState() => __TextAnimatorState();
}

class __TextAnimatorState extends State<_TextAnimator>
    with TickerProviderStateMixin {
  late List<String> splittedText = widget.data.split(' ');

  // Markdown? _markdown;
  late Timer _timer;
  int _index = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (_index >= splittedText.length) {
        timer.cancel();
      }
      setState(() {
        _index++;
      });
    });
  }

  @override
  void initState() {
    // _markdown = Markdown(data: widget.chat.data);
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          for (var i = 0; i < splittedText.length; i++)
            AnimatedCrossFade(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 500),
              sizeCurve: Curves.easeOutCirc,
              crossFadeState: _index < i
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const SizedBox.shrink(),
              secondChild: Text(
                '${splittedText[i]} ',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ParagraphElementBuilder extends MarkdownElementBuilder {
  @override
  bool isBlockElement() => true;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    log('element.textContent ${element.textContent}');
    // This where the error happens
    return null;
    // return RichText(text: TextSpan(text: element.textContent));
    // return _TextAnimator(data: element.textContent);
  }
}
// class SubscriptBuilder extends MarkdownElementBuilder {
//   @override
//   Widget visitElementAfterWithContext(
//     BuildContext context,
//     md.Element element,
//     TextStyle? preferredStyle,
//     TextStyle? parentStyle,
//   ) {
//     // This where the error happens
//     return Text(
//       element.textContent,
//       style: TextStyle(
//         fontSize: 16,
//         fontStyle: FontStyle.italic,
//         color: preferredStyle!.color,
//       ),
//     );
//   }
// }

// class CodeElementBuilder extends MarkdownElementBuilder {
//   // To determine whether the code is an inline code block or a code block
//   bool isCodeBlock(md.Element element) {
//     if (element.attributes['class'] != null) {
//       return true;
//     } else if (element.textContent.contains('\n')) {
//       return true;
//     }
//     return false;
//   }

//   @override
//   bool isBlockElement() => false;

//   @override
//   Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
//     if (!isCodeBlock(element)) {
//       return Container(
//         padding: const EdgeInsets.all(2),
//         child: Text(
//           element.textContent,
//           style: TextStyle(
//             fontSize: 16,
//             fontStyle: FontStyle.italic,
//             color: preferredStyle!.color,
//           ),
//         ),
//       );
//     } else {
//       return Container(
//         margin: const EdgeInsets.all(10),
//         child: Text(
//           element.textContent,
//           style: const TextStyle(fontSize: 16, color: Colors.white),
//         ),
//       );
//     }
//   }
// }
