part of '../main_page.dart';

class _QRISCard extends StatefulWidget {
  const _QRISCard({required this.controller});

  final ScrollController controller;

  static const double width = 200;
  static const double height = 300;

  @override
  State<_QRISCard> createState() => _QRISCardState();
}

const _qrisCardKey = Key('qris_card');

class _QRISCardState extends State<_QRISCard> {
  double _offset = 0;

  bool _isOpeningPage = false;

  late final _screenWidth = MediaQuery.of(context).size.width;

  @override
  void initState() {
    widget.controller.addListener(() {
      //
      if (widget.controller.offset <= 0) {
        setState(() {
          _offset = -widget.controller.offset;
        });
      }
      if (_offset > 0 && widget.controller.offset > 0) {
        setState(() {
          _offset = 0;
        });
      }

      if (-widget.controller.offset >= 65 && !_isOpeningPage) {
        HapticFeedback.heavyImpact();

        _isOpeningPage = true;
        Future(() async {
          await context.router.push(QRISRoute());
          await widget.controller.animateTo(
            0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
          _isOpeningPage = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Positioned.fill(
      // left: -_screenWidth + (_offset - _QRISCard.width),
      // top: AppBar().toolbarHeight,
      bottom: -_BottomNavbar.height,
      left: _offset * 7 - (_screenWidth + _QRISCard.width),
      child: Center(
        child: _offset <= 0
            ? null
            : const Material(
                type: MaterialType.transparency,
                child: QRISCardWidget(
                  size: 64,
                ),
              ),
      ),
    );
  }
}
