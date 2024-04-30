import 'dart:io';

import 'package:aidafine/router/auth_guard.dart';
import 'package:aidafine/screens/screens.dart';
import 'package:auto_route/auto_route.dart';

part 'aidafine_router.gr.dart';

@AutoRouterConfig()
class AidafineRouter extends _$AidafineRouter {
  @override
  RouteType get defaultRouteType =>
      Platform.isIOS ? const RouteType.cupertino() : const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          guards: [AidafineGuard()],
          page: RoomRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
      ];
}
