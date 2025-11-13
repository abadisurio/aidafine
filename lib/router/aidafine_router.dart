import 'dart:io';

import 'package:aidafine/engine/models/models.dart';
import 'package:aidafine/router/auth_guard.dart';
import 'package:aidafine/screens/screens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emvqrcode/emvqrcode.dart';
import 'package:flutter/material.dart';

part 'aidafine_router.gr.dart';

@AutoRouterConfig()
class AidafineRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      Platform.isIOS ? const RouteType.cupertino() : const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute<void>(
          initial: true,
          page: RootRoute.page,
          children: [
            CustomRoute<void>(
              transitionsBuilder: TransitionsBuilders.noTransition,
              initial: true,
              guards: [AidafineGuard()],
              page: MainRoute.page,
              children: [
                AutoRoute(
                  page: QRISRoute.page,
                ),
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
              guards: [AidafineGuard()],
              page: RoomRoute.page,
            ),
            CustomRoute<void>(
              guards: [AidafineGuard()],
              page: BillSummarizerRoute.page,
              opaque: false,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute<void>(
              guards: [AidafineGuard()],
              page: QRISPayRoute.page,
              opaque: false,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            AutoRoute(
              guards: [AidafineGuard()],
              page: AppPreferencesRoute.page,
            ),
            CustomRoute<void>(
              // initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              guards: [AidafineGuard()],
              page: QRISRoute.page,
              path: 'pay-qris',
            ),
            CustomRoute<void>(
              // initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              guards: [AidafineGuard()],
              page: GenieRoute.page,
              path: 'genie',
              opaque: false,
            ),
            CustomRoute<void>(
              // initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              guards: [AidafineGuard()],
              opaque: false,
              page: GenieResultRoute.page,
              path: 'genie-result',
              barrierDismissible: false,
            ),
          ],
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
      ];
}
