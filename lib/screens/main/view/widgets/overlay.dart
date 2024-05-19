part of '../main_page.dart';

class _Overlay extends StatefulWidget {
  const _Overlay({required this.controller});
  final PageController controller;
  @override
  State<_Overlay> createState() => _OverlayState();
}

class _OverlayState extends State<_Overlay> {
  double _offset = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      if ((widget.controller.offset) <= 0) {
        setState(() {
          _offset = -widget.controller.offset / 100;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: _offset.clamp(0, 1),
        child: SizedBox.expand(
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
