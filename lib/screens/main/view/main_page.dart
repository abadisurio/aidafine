import 'dart:async';

import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/screens/screens.dart' hide VoicePrompt;
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
    final pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          _PageView(controller: pageController),
          _Overlay(controller: pageController),
          _QRISCard(controller: pageController),
        ],
      ),
      bottomNavigationBar: _BottomNavbar(controller: pageController),
    );
  }
}

class _PageView extends StatefulWidget {
  const _PageView({required this.controller});

  final PageController controller;

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      children: const [
        DashboardPage(),
        RoomPage(),
      ],
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
