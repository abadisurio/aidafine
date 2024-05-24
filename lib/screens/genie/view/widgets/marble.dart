part of '../genie_page.dart';

class _Marble extends StatefulWidget {
  const _Marble();

  static const double size = 64;

  @override
  State<_Marble> createState() => _MarbleState();
}

class _MarbleState extends State<_Marble> {
  bool _isMounted = false;
  bool _isDone = false;
  final _duration = Durations.long2;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isMounted = true;
      });
      Future<void>.delayed(_duration + Durations.short1, () {
        if (mounted) {
          setState(() {
            _isDone = true;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _isDone ? Colors.transparent : Colors.blue.withOpacity(0.5),
      ),
      height: !_isMounted ? 0 : _Marble.size,
      width: !_isMounted ? 0 : _Marble.size,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
