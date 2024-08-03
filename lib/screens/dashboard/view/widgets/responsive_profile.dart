part of '../dashboard_page.dart';

class _ResponsiveProfile extends StatefulWidget {
  const _ResponsiveProfile({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_ResponsiveProfile> createState() => _ResponsiveProfileState();
}

class _ResponsiveProfileState extends State<_ResponsiveProfile> {
  late final _screenWidth = MediaQuery.of(context).size.width;
  double _offset = 0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;
      if (offset > -20 && offset < (_screenWidth / 2 + 20)) {
        setState(() {
          _offset = widget.scrollController.offset;
        });
        // log('_offset $_offset');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log('debug _offset / _screenWidth ${_offset * 2 / _screenWidth}');
    return Align(
      alignment: Alignment.topLeft,
      // child: ColoredBox(
      //   color: _offset <= (_screenWidth / 2)
      //       ? Colors.transparent
      //       : Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              // if (_offset > 0)
              BoxShadow(
                color: (MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.black
                        : Colors.white)
                    .withOpacity((_offset * 2 / _screenWidth).clamp(0, 1)),
                blurRadius: 15,
                // blurStyle: BlurStyle.solid,
                // spreadRadius: -12,
              ),
            ],
          ),
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: _screenWidth / 2 -
                  18 -
                  _offset.clamp(0, _screenWidth / 2 - 6) / 2,
              width:
                  _screenWidth / 2 - 18 + _offset.clamp(0, _screenWidth - 18),
              decoration: BoxDecoration(color: Colors.indigo.shade400),
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 55,
                        maxHeight: 55,
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: 'https://i.pravatar.cc/70',
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Abadi Suryo',
                            style: TextStyleTheme(context).titleLarge,
                          ),
                          const SizedBox(height: 4),
                          const _BalanceVisibility(balance: 5437628),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BalanceVisibility extends StatefulWidget {
  const _BalanceVisibility({this.balance = 0});

  final double balance;

  @override
  State<_BalanceVisibility> createState() => _BalanceVisibilityState();
}

class _BalanceVisibilityState extends State<_BalanceVisibility> {
  final bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    final balance = appCurrencyFormat.format(widget.balance);
    return Row(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.centerLeft,
          curve: Curves.easeInOutCirc,
          child: Row(
            children: [
              if (_isVisible)
                Text(
                  balance,
                  style: TextStyleTheme(context).titleMedium,
                )
              else
                Text(
                  'Rp ••••••',
                  style: TextStyleTheme(context).titleMedium,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       _isVisible = !_isVisible;
        //     });
        //   },
        //   child: const Icon(
        //     Icons.remove_red_eye_outlined,
        //     size: 18,
        //   ),
        // ),
      ],
    );
  }
}
