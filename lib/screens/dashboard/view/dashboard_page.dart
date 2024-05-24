// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:aidafine/app/themes/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
    );
  }
}

class _DashboardBody extends StatefulWidget {
  const _DashboardBody();

  @override
  State<_DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<_DashboardBody> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        unawaited(HapticFeedback.mediumImpact());
        await Future<void>.delayed(const Duration(seconds: 1));
      },
      displacement: kToolbarHeight,
      edgeOffset: Platform.isIOS ? 40 : 0,
      child: ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        // reverse: true,
        children: const [
          _Shortcuts(),
          // Text('text'),
        ],
      ),
    );
  }
}

class _Shortcuts extends StatelessWidget {
  const _Shortcuts();

  @override
  Widget build(BuildContext context) {
    final brigthness = Theme.of(context).brightness;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          brigthness == Brightness.light ? Colors.black : Colors.white,
      foregroundColor:
          brigthness == Brightness.light ? Colors.white : Colors.black,
      padding: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      minimumSize: const Size.square(60),
    );
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w700,
      // fontSize: 12,
    );
    return Padding(
      padding: const EdgeInsets.all(12),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: ClipPath(
              clipper: const ShapeBorderClipper(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: brigthness == Brightness.light
                      ? Colors.purple.shade400
                      : Colors.purple.shade700,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                          '''https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&h=60''',
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'abadisurio',
                      style: TextStyleTheme(context).titleMedium,
                    ),
                    Text(
                      'Rp50.000',
                      style: TextStyleTheme(context).titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.outbond_outlined,
                    size: 40,
                  ),
                  Text(
                    'Transfer',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet,
                    size: 40,
                  ),
                  Text(
                    'E-wallet',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 40,
                  ),
                  Text(
                    'Bayar',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.savings_outlined,
                    size: 40,
                  ),
                  Text(
                    'Tabungan',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle.copyWith(
                backgroundColor: MaterialStatePropertyAll(
                  brigthness == Brightness.light
                      ? Colors.orange.shade500
                      : Colors.orange.shade700,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Icon(
                      Icons.trending_up,
                      size: 40,
                      color: brigthness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Pengeluaran meningkat',
                      style: labelStyle.copyWith(
                        color: brigthness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: ClipPath(
              clipper: const ShapeBorderClipper(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: brigthness == Brightness.light
                      ? Colors.teal.shade400
                      : Colors.teal.shade700,
                ),
                child: const Text('text'),
              ),
            ),
          ),
        ],
      ),
    );

    // return Wrap(
    //   spacing: 12,
    //   runSpacing: 12,
    //   alignment: WrapAlignment.center,
    //   children: [
    //     for (var i = 0; i < 8; i++)
    //       ElevatedButton(
    //         style: ElevatedButton.styleFrom(
    //           backgroundColor:
    //               brigthness == Brightness.light ? Colors.black : Colors.white,
    //           foregroundColor:
    //               brigthness == Brightness.light ? Colors.white : Colors.black,
    //           padding: EdgeInsets.zero,
    //           shape: ContinuousRectangleBorder(
    //             borderRadius: BorderRadius.circular(60),
    //           ),
    //           // maximumSize: const Size.square(61),
    //           // minimumSize: const Size.square(60),
    //           fixedSize: Size.square(i == 0 ? 80 * 2 : 80),
    //           // fixedSize: const Size(150, 50),
    //           // minimumSize: const Size(60, 60),
    //         ),
    //         onPressed: () {
    //
    //         },
    //         child: const Icon(Icons.ice_skating),
    //       ),
    //   ],
    // );
  }
}

// class _ extends StatelessWidget {
//   const _({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
