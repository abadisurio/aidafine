// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'aidafine_router.dart';

abstract class _$AidafineRouter extends RootStackRouter {
  // ignore: unused_element
  _$AidafineRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    GenieRoute.name: (routeData) {
      return AutoRoutePage<String?>(
        routeData: routeData,
        child: const GeniePage(),
      );
    },
    GenieResultRoute.name: (routeData) {
      final args = routeData.argsAs<GenieResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GenieResultPage(
          prompt: args.prompt,
          key: args.key,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    QRISRoute.name: (routeData) {
      final args =
          routeData.argsAs<QRISRouteArgs>(orElse: () => const QRISRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QRISPage(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    RoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoomPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
  };
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeniePage]
class GenieRoute extends PageRouteInfo<void> {
  const GenieRoute({List<PageRouteInfo>? children})
      : super(
          GenieRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenieRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GenieResultPage]
class GenieResultRoute extends PageRouteInfo<GenieResultRouteArgs> {
  GenieResultRoute({
    required String prompt,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GenieResultRoute.name,
          args: GenieResultRouteArgs(
            prompt: prompt,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GenieResultRoute';

  static const PageInfo<GenieResultRouteArgs> page =
      PageInfo<GenieResultRouteArgs>(name);
}

class GenieResultRouteArgs {
  const GenieResultRouteArgs({
    required this.prompt,
    this.key,
  });

  final String prompt;

  final Key? key;

  @override
  String toString() {
    return 'GenieResultRouteArgs{prompt: $prompt, key: $key}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QRISPage]
class QRISRoute extends PageRouteInfo<QRISRouteArgs> {
  QRISRoute({
    Key? key,
    int? amount,
    List<PageRouteInfo>? children,
  }) : super(
          QRISRoute.name,
          args: QRISRouteArgs(
            key: key,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'QRISRoute';

  static const PageInfo<QRISRouteArgs> page = PageInfo<QRISRouteArgs>(name);
}

class QRISRouteArgs {
  const QRISRouteArgs({
    this.key,
    this.amount,
  });

  final Key? key;

  final int? amount;

  @override
  String toString() {
    return 'QRISRouteArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [RoomPage]
class RoomRoute extends PageRouteInfo<void> {
  const RoomRoute({List<PageRouteInfo>? children})
      : super(
          RoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
