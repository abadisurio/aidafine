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
        log('cekkk');
        setState(() {
          _page = newPage;
        });
      }
    });
    super.initState();
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
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 60),
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
          for (int i = 0; i < 2; i++)
            Padding(
              padding: EdgeInsets.only(right: i == 1 ? 0 : 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: Colors.black,
                ),
                child: AnimatedSize(
                  alignment: Alignment.topLeft,
                  duration: Durations.medium2,
                  curve: Curves.easeInOut,
                  child: Row(
                    children: [
                      Icon(
                        [Icons.home, Icons.assistant][i],
                        size: 30,
                      ),
                      if (_page != i)
                        const SizedBox.shrink()
                      else ...[
                        const SizedBox(width: 8),
                        Text(['Home', 'Assistant'][i]),
                      ],
                    ],
                  ),
                ),
                onPressed: () {
                  // setState(() {
                  //   _page = i;
                  // });
                  widget.controller.animateToPage(
                    i,
                    duration: Durations.medium2,
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
