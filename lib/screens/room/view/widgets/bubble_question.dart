import 'package:aidafine/engine/engine.dart';
import 'package:flutter/material.dart';

class BubbleQuestion extends StatelessWidget {
  const BubbleQuestion({
    required this.chat,
    super.key,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: onTap,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            chat.data,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
