import 'package:aidafine/screens/main/main.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class QRISPage extends StatelessWidget {
  const QRISPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _QRISView();
  }
}

class _QRISView extends StatefulWidget {
  const _QRISView();

  @override
  State<_QRISView> createState() => _QRISViewState();
}

class _QRISViewState extends State<_QRISView> {
  bool _isMounted = false;
  @override
  void initState() {
    Future.delayed(
      Durations.medium2,
      () {
        setState(() {
          _isMounted = true;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          const Center(child: QRISCardWidget(size: 64)),
          AnimatedOpacity(
            opacity: _isMounted ? 1 : 0,
            duration: Durations.medium2,
            curve: Curves.easeInOut,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('QRIS'),
                leading: IconButton(
                  onPressed: () => context.router.maybePop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              body: const Center(
                child: Text('wkwk'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
