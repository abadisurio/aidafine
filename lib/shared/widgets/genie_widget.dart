import 'package:aidafine/app/app.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenieWidget extends StatefulWidget {
  const GenieWidget({super.key});

  @override
  State<GenieWidget> createState() => _GenieWidgetState();
}

class _GenieWidgetState extends State<GenieWidget> {
  // bool _isMounted = false;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     _isMounted = true;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log('debug _isMounted $_isMounted');
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<GeminiVoiceBloc, GeminiVoiceState>(
          buildWhen: (previous, current) {
            return previous.showGenieWidget != current.showGenieWidget;
          },
          builder: (context, state) {
            return AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              curve: state.showGenieWidget
                  ? Curves.easeInCirc
                  : Curves.easeOutCirc,
              offset:
                  !state.showGenieWidget ? Offset.zero : const Offset(0, -2),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  // color: Colors.grey.shade800,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          '✨',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Listening',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
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
