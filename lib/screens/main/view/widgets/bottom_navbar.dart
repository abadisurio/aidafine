part of '../main_page.dart';

class _BottomNavbar extends StatefulWidget {
  const _BottomNavbar();

  static const double height = 60;
  @override
  State<_BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<_BottomNavbar> {
  late TabsRouter _tabRouter;

  @override
  void initState() {
    _tabRouter = AutoTabsRouter.of(context);
    super.initState();
  }

  Future<void> _openGenie() async {
    unawaited(HapticFeedback.mediumImpact());
    context
        .read<GeminiVoiceBloc>()
        .add(const ToggleShowGenieWidget(showSpokenWords: true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        8,
        8,
        8,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _tabRouter.navigate(QRISRoute());
            },
            child: const Text('QRIS'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              _tabRouter.navigate(const DashboardRoute());
            },
            child: const Text('Home'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              _tabRouter.navigate(const RoomRoute());
            },
            onLongPress: _openGenie,
            child: const Text('Genie'),
          ),
        ],
      ),
    );
  }
}
