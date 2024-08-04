import 'dart:ui';

import 'package:aidafine/app/app.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenieWidgetContainer extends StatefulWidget {
  const GenieWidgetContainer({super.key});

  @override
  State<GenieWidgetContainer> createState() => _GenieWidgetContainerState();
}

class _GenieWidgetContainerState extends State<GenieWidgetContainer> {
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
    // final radius = context.screenPadding.top - 4;
    // log('debug radius $radius');
    return BlocBuilder<GeminiVoiceBloc, GeminiVoiceState>(
      buildWhen: (previous, current) {
        return previous.showGenieWidget != current.showGenieWidget;
      },
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              reverseDuration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: !state.showGenieWidget
                  ? const SizedBox.shrink()
                  : const _GlowOverlay(),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -2),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCirc,
                          reverseCurve: Curves.easeIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                  child: !state.showGenieWidget
                      ? SizedBox(width: context.screenWidth)
                      : const Padding(
                          padding: EdgeInsets.all(6),
                          child: _GenieWidget(),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GenieWidget extends StatelessWidget {
  const _GenieWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const Spacer(),
            InkWell(
              onTap: () {
                context.read<GeminiVoiceBloc>().add(
                      const ToggleShowGenieWidget(
                        isShown: false,
                      ),
                    );
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowOverlay extends StatefulWidget {
  const _GlowOverlay();

  @override
  State<_GlowOverlay> createState() => __GlowOverlayState();
}

class __GlowOverlayState extends State<_GlowOverlay> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 25,
          sigmaY: 25,
          tileMode: TileMode.decal,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Transform.scale(
            scale: 1.5,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              // width: 10,
              height: context.screenPadding.top + kToolbarHeight / 1.5,
              // height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [
                    // Colors.red.withOpacity(0.8),
                    Colors.blue.withOpacity(0.8),
                    Colors.red.withOpacity(0.8),
                    Colors.blue.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
