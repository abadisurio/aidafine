import 'dart:async';
import 'package:aidafine/app/view/app.dart';
import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/shared/blocs/blocs.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './widgets/bottom_navbar.dart';
part './widgets/qris_card.dart';
part './widgets/overlay.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainView();
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return const _PageView();
  }
}

class _PageView extends StatefulWidget {
  const _PageView();

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  int _activeIndex = 1;
  double _bottomPadding = 0;
  PageController? _pageController;

  void _listener() {
    final offset = _pageController?.offset ?? 0;
    if (offset > 0 && offset < context.screenWidth * 2) {
      final offset2 =
          (context.screenWidth - offset).abs() / context.screenWidth;
      // log('debug offset $offset2');
      setState(() {
        _bottomPadding = offset2 * _BottomNavbar.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      // homeIndex: 1,
      physics: const BouncingScrollPhysics(),
      routes: [
        QRISRoute(),
        const DashboardRoute(),
        const RoomRoute(),
      ],
      builder: (context, child, pageController) {
        // log('debug pageController.offset ${pageController.offset}');
        // log('debug context.screenWidth ${context.screenWidth}');
        final tabRouter = AutoTabsRouter.of(context);
        if (!pageController.hasClients ||
            _activeIndex != tabRouter.activeIndex) {
          _pageController?.removeListener(_listener);
          _pageController = pageController;
          _pageController?.addListener(_listener);
        }
        _activeIndex = tabRouter.activeIndex;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                // duration: Durations.long4,
                // curve: Curves.easeOutCirc,
                padding: EdgeInsets.only(bottom: _bottomPadding),
                // child: child,
                child: child,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: _BottomNavbar(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class QRISCardWidget extends StatelessWidget {
  const QRISCardWidget({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _qrisCardKey,
      child: ClipPath(
        clipper: const ShapeBorderClipper(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return AnimatedContainer(
              duration: Durations.long4,
              curve: Curves.easeOutCirc,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red.shade800,
              ),
              height: _QRISCard.height,
              width: _QRISCard.width,
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code, size: size),
                    Text(
                      'QRIS',
                      style: TextStyle(
                        fontSize: size / 2.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
