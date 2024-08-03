// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:aidafine/app/themes/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'widgets/shortcuts.dart';
part 'widgets/favorite_payment.dart';
part 'widgets/favorite_transfer.dart';
part 'widgets/responsive_profile.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        unawaited(HapticFeedback.mediumImpact());
        await Future<void>.delayed(const Duration(seconds: 1));
      },
      displacement: MediaQuery.of(context).padding.top,
      edgeOffset: Platform.isIOS ? 40 : 0,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          // backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text('Aidafine'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: const _DashboardBody(),
      ),
    );
  }
}

// const _customScrollKey = Key('center-key');

class _DashboardBody extends StatefulWidget {
  const _DashboardBody();

  @override
  State<_DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<_DashboardBody> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // center: _customScrollKey,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // _AppBar(),
        _Header(scrollController: _scrollController),
        const _FavoriteTransfer(),
        const _FavoritePayment(),
        const _FavoriteTransfer(),
        const _FavoritePayment(),
        const _FavoriteTransfer(),
        const _FavoritePayment(),
        // const SliverFillRemaining(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      pinned: true,
      stretch: true,
      // snap: false,
      // floating: false,
      expandedHeight: screenWidth * 3 / 4 + 12,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        title: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 4),
          child: _ResponsiveProfile(scrollController: scrollController),
        ),
        // title: const Text('text'),
        titlePadding: EdgeInsets.zero,
        expandedTitleScale: 1,
        background: const Center(child: _Shortcuts()),
        stretchModes: const <StretchMode>[
          StretchMode.blurBackground,
        ],
      ),
      toolbarHeight: screenWidth / 4 + 24,
      forceMaterialTransparency: true,
      collapsedHeight: screenWidth / 4 + 24,
    );
  }
}
