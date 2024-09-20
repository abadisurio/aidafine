part of '../main_page.dart';

class _BottomNavbar extends StatefulWidget {
  const _BottomNavbar();

  static const double height = 60;
  @override
  State<_BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<_BottomNavbar> {
  late TabsRouter _tabRouter;
  late final _bloc = context.read<GeminiVoiceBloc>();
  @override
  void initState() {
    _tabRouter = AutoTabsRouter.of(context);
    super.initState();
  }

  Future<void> _openGenie() async {
    unawaited(HapticFeedback.mediumImpact());
    _bloc.add(
      const ToggleShowGenieWidget(
        showSpokenWords: true,
        isLongPress: true,
      ),
    );
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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onLongPressCancel: () {
              _bloc.add(const ToggleShowGenieWidget(isShown: false));
            },
            onLongPressEnd: (details) {
              log('debug onTapCancel');
              final isShow = _bloc.state.showGenieWidget;
              if (isShow) {
                _bloc.add(const ProceedPrompt());
              }
            },
            onTap: () {
              _tabRouter.navigate(const RoomRoute());
            },
            onLongPress: _openGenie,
            child: AbsorbPointer(
              child: ElevatedButton(
                onPressed: () {},
                onLongPress: () {},
                child: const Text('Genie'),
              ),
            ),
            // child: Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(99),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: const Text('text'),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
