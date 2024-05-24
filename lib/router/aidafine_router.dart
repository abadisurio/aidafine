import 'dart:io';

import 'package:aidafine/router/auth_guard.dart';
import 'package:aidafine/screens/screens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'aidafine_router.gr.dart';

@AutoRouterConfig()
class AidafineRouter extends _$AidafineRouter {
  @override
  RouteType get defaultRouteType =>
      Platform.isIOS ? const RouteType.cupertino() : const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          initial: true,
          guards: [AidafineGuard()],
          page: MainRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: DashboardRoute.page,
            ),
            AutoRoute(
              page: RoomRoute.page,
            ),
          ],
        ),
        AutoRoute(
          // initial: true,
          guards: [AidafineGuard()],
          page: RoomRoute.page,
        ),
        CustomRoute(
          // initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          guards: [AidafineGuard()],
          page: QRISRoute.page,
          path: '/pay-qris',
        ),
        CustomRoute(
          // initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          guards: [AidafineGuard()],
          page: GenieRoute.page,
          path: '/genie',
          opaque: false,
        ),
        CustomRoute(
          // initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          guards: [AidafineGuard()],
          opaque: false,
          page: GenieResultRoute.page,
          path: '/genie-result',
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
      ];
}
