part of '../main_page.dart';

class _BottomNavbar extends StatefulWidget {
  const _BottomNavbar({required this.controller});

  final PageController controller;
  static const double height = 90;
  @override
  State<_BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<_BottomNavbar> {
  int _page = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      final newPage = ((widget.controller.page ?? 0) + 0.5).toInt();
      if (newPage != _page) {
        setState(() {
          _page = newPage;
        });
        if (_page != 1) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      }
    });
    super.initState();
  }

  Future<void> _openGenie() async {
    unawaited(HapticFeedback.mediumImpact());
    context.read<GeminiVoiceBloc>().add(const ToggleShowGenieWidget());
    // final result = await context.router.push<String?>(const GenieRoute());
    // if (mounted && result != null) {
    //   log('GenieResult $result');
    //   await context.router.push(GenieResultRoute(prompt: result));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _BottomNavbar.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.fromLTRB(
        8,
        8,
        8,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // minimumSize: const Size(40, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: Colors.black,
                ),
                child: const Icon(Icons.qr_code, size: 30),
                onPressed: () {
                  // context.router.push(const QRISRoute());
                  widget.controller.animateTo(
                    -65,
                    duration: Durations.short4,
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // minimumSize: const Size(40, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: Colors.black,
                ),
                child: AnimatedSize(
                  alignment: Alignment.topLeft,
                  duration: Durations.medium2,
                  curve: Curves.easeInOut,
                  child: Row(
                    children: [
                      const Icon(Icons.home, size: 30),
                      if (_page != 0)
                        const SizedBox.shrink()
                      else ...[
                        const SizedBox(width: 8),
                        const Text('Home'),
                      ],
                    ],
                  ),
                ),
                onPressed: () {
                  widget.controller.animateToPage(
                    0,
                    duration: Durations.medium2,
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // minimumSize: const Size(40, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: Colors.black,
                ),
                onLongPress: _openGenie,
                onPressed: () {
                  widget.controller.animateToPage(
                    1,
                    duration: Durations.medium2,
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedSize(
                  alignment: Alignment.topLeft,
                  duration: Durations.medium2,
                  curve: Curves.easeInOut,
                  child: Row(
                    children: [
                      const Icon(Icons.assistant, size: 30),
                      if (_page != 1)
                        const SizedBox.shrink()
                      else ...[
                        const SizedBox(width: 8),
                        const Text('Assistant'),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 50,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: GeminiVoiceButton(
          //       onStop: (path) {
          //         context.read<GeminiVoiceBloc>().add(VoicePrompt(path));
          //       },
          //       button: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           // minimumSize: const Size(40, 60),
          //           padding: const EdgeInsets.symmetric(horizontal: 24),
          //           backgroundColor: Colors.black,
          //         ),
          //         child: AnimatedSize(
          //           alignment: Alignment.topLeft,
          //           duration: Durations.medium2,
          //           curve: Curves.easeInOut,
          //           child: Row(
          //             children: [
          //               const Icon(Icons.assistant, size: 30),
          //               if (_page != 1)
          //                 const SizedBox.shrink()
          //               else ...[
          //                 const SizedBox(width: 8),
          //                 const Text('Assistant'),
          //               ],
          //             ],
          //           ),
          //         ),
          //         onPressed: () {
          //           widget.controller.animateToPage(
          //             1,
          //             duration: Durations.medium2,
          //             curve: Curves.easeInOut,
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
