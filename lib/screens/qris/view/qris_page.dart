// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/screens/qris/qris.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'camera_view.dart';

@RoutePage()
class QRISPage extends StatefulWidget {
  const QRISPage({
    this.amount,
    super.key,
  });
  final double? amount;

  @override
  State<QRISPage> createState() => _QRISPageState();
}

class _QRISPageState extends State<QRISPage> {
  bool _isLanded = false;
  final _cameraBloc = CameraBloc();
  @override
  void initState() {
    final scope = TabsRouterScope.of(context);
    if (scope != null) {
      final tabRouter = AutoTabsRouter.of(context);
      tabRouter.addListener(() {
        setState(() {
          _isLanded = tabRouter.activeIndex == 0;
        });
        if (!_isLanded) {
          _cameraBloc.add(const DisposeCamera());
        }
      });
    } else {
      setState(() {
        _isLanded = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _cameraBloc,
        ),
        BlocProvider(
          create: (_) => QRISBloc(amount: widget.amount),
        ),
      ],
      child: Scaffold(
        body: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          duration: Durations.medium3,
          child: _isLanded ? const _QRISCameraView() : const _QRISPeekingView(),
        ),
      ),
    );
  }
}

class _QRISPeekingView extends StatelessWidget {
  const _QRISPeekingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('text'),
    );
  }
}

class _QRISCameraView extends StatefulWidget {
  const _QRISCameraView();

  @override
  State<_QRISCameraView> createState() => _QRISCameraViewState();
}

class _QRISCameraViewState extends State<_QRISCameraView> {
  bool _isMounted = false;
  String? amount;
  @override
  void initState() {
    // const emvqr =
    //     '''00020101021240530013ID.CO.BCA.WWW0118936000141577135652021057713565255204482953033605405500005802ID5918ABADI SURYO SETIYO6013Jakarta Pusat61051031062470804DMCT9935000200012557713565250017163042364086304655C''';
    // final emvdecode = EMVMPM.decode(emvqr);
    // log('emvdecode ${emvdecode.toJson()}');
    final stateAmount = context.read<QRISBloc>().state.amount;
    if (stateAmount != null) {
      final format = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      amount = format.format(stateAmount);
    }
    // Future.delayed(
    //   Durations.medium2,
    //   () {
    //   },
    // );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isMounted = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('debug _isMounted $_isMounted');

    return const Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            _TopSection(),
            _MiddleSection(),
            _BottomSection(),
          ],
        ),
      ),
    );
    // return Material(
    //   color: Theme.of(context).scaffoldBackgroundColor,
    //   child: Stack(
    //     children: [
    //       const Center(child: QRISCardWidget(size: 64)),
    //       AnimatedOpacity(
    //         opacity: _isMounted ? 1 : 0,
    //         duration: Durations.medium2,
    //         curve: Curves.easeInOut,
    //         child: Scaffold(
    //           appBar: AppBar(
    //             centerTitle: true,
    //             title: const Text('QRIS'),
    //             leading: IconButton(
    //               onPressed: () => context.router.maybePop(),
    //               icon: const Icon(Icons.close),
    //             ),
    //           ),
    //           body: Center(
    //             child: AspectRatio(
    //               aspectRatio: 1,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(32),
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(32),
    //                     color: Colors.black,
    //                   ),
    //                   // height: 300,
    //                   // width: 300,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       const Icon(
    //                         Icons.qr_code,
    //                         size: 120,
    //                       ),
    //                       Text(
    //                         'ceritanya kamera',
    //                         style: TextStyleTheme(context).titleLarge,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SafeArea(
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: kToolbarHeight),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               AnimatedSize(
    //                 duration: Durations.medium2,
    //                 curve: Curves.easeOutCirc,
    //                 child: !_isMounted || amount == null
    //                     ? const SizedBox.shrink()
    //                     : Padding(
    //                         padding: const EdgeInsets.all(16),
    //                         child: Card(
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(16),
    //                             child: Text(
    //                               'Tagihan terdeteksi: $amount',
    //                               style: TextStyleTheme(context).titleMedium,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //               ),
    //               const Spacer(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                final scope = TabsRouterScope.of(context);
                if (scope != null) {
                  AutoTabsRouter.of(context).navigate(const DashboardRoute());
                } else {
                  context.router.maybePop();
                }
                context.read<CameraBloc>().add(const DisposeCamera());
              },
              child: const Icon(Icons.close),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: BlocBuilder<QRISBloc, QRISState>(
            //       buildWhen: (_, __) => false,
            //       builder: (context, state) {
            //         return Text(
            //           state.album.name,
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 24,
            //           ),
            //           maxLines: 2,
            //           overflow: TextOverflow.ellipsis,
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _MiddleSection extends StatelessWidget {
  const _MiddleSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onDoubleTap: () {
              context.read<CameraBloc>().add(const Capture());
            },
            child: const _CameraView(),
          ),
        ),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(10, 10),
                maximumSize: const Size(80, 80),
                padding: const EdgeInsets.all(3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {
                context.read<CameraBloc>().add(const ToggleFlash());
              },
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/80/80',
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
            BlocBuilder<CameraBloc, CameraState>(
              buildWhen: (prev, curr) =>
                  prev.flashMode != curr.flashMode ||
                  prev.cameraNumber != curr.cameraNumber,
              builder: (context, state) {
                // if (state.cameraNumber == 1) {
                //   return const SizedBox.shrink();
                // }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(10, 10),
                    maximumSize: const Size(80, 80),
                    padding: const EdgeInsets.all(3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    context.read<CameraBloc>().add(const ToggleFlash());
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        () {
                          log('state.flashMode ${state.flashMode}');
                          switch (state.flashMode) {
                            case FlashMode.auto:
                              return Icons.flash_auto;
                            case FlashMode.always:
                              return Icons.flash_on;
                            case FlashMode.off:
                              return Icons.flash_off;
                            case FlashMode.torch:
                              break;
                          }
                        }(),
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
