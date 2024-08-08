// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/screens/qris/qris.dart';
import 'package:aidafine/shared/blocs/app_preferences_bloc.dart';
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
  bool _showWindow = false;

  late final CameraBloc _cameraBloc;
  late final QRISBloc _qrisBloc;
  @override
  void initState() {
    _cameraBloc = CameraBloc();
    _qrisBloc = QRISBloc(amount: widget.amount);

    final scope = TabsRouterScope.of(context);
    if (scope != null) {
      final tabRouter = AutoTabsRouter.of(context);
      tabRouter.addListener(() {
        setState(() {
          _showWindow = tabRouter.activeIndex == 0;
        });

        final callGenieWhenOpenQRIS = (context
                .read<AppPreferencesBloc>()
                .state
                .preferences[PreferenceID.callGenieWhenOpenQRIS]
                ?.value as bool?) ??
            AppPreferencesState
                .defaultValues
                .preferences[PreferenceID.callGenieWhenOpenQRIS]!
                .value! as bool;
        if (callGenieWhenOpenQRIS) {
          Future.delayed(Durations.long2, () {
            if (_qrisBloc.state.data == null) {
              context
                  .read<GeminiVoiceBloc>()
                  .add(ToggleShowGenieWidget(isShown: _showWindow));
            }
          });
        }

        if (!_showWindow) {
          _cameraBloc.add(const DisposeCamera());
        }
      });
    } else {
      setState(() {
        _showWindow = true;
      });
      Future.delayed(Durations.long2, () {
        if (_qrisBloc.state.data == null) {
          context
              .read<GeminiVoiceBloc>()
              .add(ToggleShowGenieWidget(isShown: _showWindow));
        }
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
          create: (_) => _qrisBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CameraBloc, CameraState>(
            bloc: _cameraBloc,
            listenWhen: (previous, current) {
              return previous.controller != current.controller;
            },
            listener: (context, state) {
              if (state.controller != null) {
                context.read<QRISBloc>().add(
                      StartScanningQRIS(cameraController: state.controller!),
                    );
              } else {
                context.read<QRISBloc>().add(const StopScanningQRIS());
              }
            },
          ),
          BlocListener<QRISBloc, QRISState>(
            bloc: _qrisBloc,
            listenWhen: (previous, current) {
              return previous.data != current.data;
            },
            listener: (context, state) {
              final qrisData = state.data;
              if (qrisData == null) return;
              context.read<CameraBloc>().add(const DisposeCamera());
              final scope = TabsRouterScope.of(context);
              if (scope != null) {
                // await context.router.replace(QRISPayRoute(qrisData: qrisData));

                context.router.push(QRISPayRoute(qrisData: qrisData));
                Future.delayed(Durations.extralong4, () {
                  AutoTabsRouter.of(context).navigate(const DashboardRoute());
                });
              } else {
                context.router.replace(QRISPayRoute(qrisData: qrisData));
              }
              // Future(() async {
              // });
            },
          ),
        ],
        child: Scaffold(
          body: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            duration: Durations.medium3,
            child: _showWindow
                ? const _QRISCameraView()
                : const _QRISPeekingView(),
          ),
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
  // bool _isMounted = false;
  String? amount;
  @override
  void initState() {
    final stateAmount = context.read<QRISBloc>().state.amount;
    if (stateAmount != null) {
      final format = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      amount = format.format(stateAmount);
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     _isMounted = true;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
