import 'package:flutter/material.dart';

class GenieWidget extends StatelessWidget {
  const GenieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}



// class _Overlays extends StatelessWidget {
//   const _Overlays({required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       child,
//     ],);
//   }
// }
