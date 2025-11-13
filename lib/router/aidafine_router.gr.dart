// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'aidafine_router.dart';

/// generated route for
/// [AppPreferencesPage]
class AppPreferencesRoute extends PageRouteInfo<void> {
  const AppPreferencesRoute({List<PageRouteInfo>? children})
      : super(
          AppPreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppPreferencesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppPreferencesPage();
    },
  );
}

/// generated route for
/// [BillSummarizerPage]
class BillSummarizerRoute extends PageRouteInfo<BillSummarizerRouteArgs> {
  BillSummarizerRoute({
    required BillSummary billSummary,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BillSummarizerRoute.name,
          args: BillSummarizerRouteArgs(
            billSummary: billSummary,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BillSummarizerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BillSummarizerRouteArgs>();
      return BillSummarizerPage(
        billSummary: args.billSummary,
        key: args.key,
      );
    },
  );
}

class BillSummarizerRouteArgs {
  const BillSummarizerRouteArgs({
    required this.billSummary,
    this.key,
  });

  final BillSummary billSummary;

  final Key? key;

  @override
  String toString() {
    return 'BillSummarizerRouteArgs{billSummary: $billSummary, key: $key}';
  }
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeniePage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GenieResultRouteArgs>();
      return GenieResultPage(
        prompt: args.prompt,
        key: args.key,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [QRISPage]
class QRISRoute extends PageRouteInfo<QRISRouteArgs> {
  QRISRoute({
    double? amount,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QRISRoute.name,
          args: QRISRouteArgs(
            amount: amount,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QRISRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<QRISRouteArgs>(orElse: () => const QRISRouteArgs());
      return QRISPage(
        amount: args.amount,
        key: args.key,
      );
    },
  );
}

class QRISRouteArgs {
  const QRISRouteArgs({
    this.amount,
    this.key,
  });

  final double? amount;

  final Key? key;

  @override
  String toString() {
    return 'QRISRouteArgs{amount: $amount, key: $key}';
  }
}

/// generated route for
/// [QRISPayPage]
class QRISPayRoute extends PageRouteInfo<QRISPayRouteArgs> {
  QRISPayRoute({
    required EmvqrModel qrisData,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QRISPayRoute.name,
          args: QRISPayRouteArgs(
            qrisData: qrisData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QRISPayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QRISPayRouteArgs>();
      return QRISPayPage(
        qrisData: args.qrisData,
        key: args.key,
      );
    },
  );
}

class QRISPayRouteArgs {
  const QRISPayRouteArgs({
    required this.qrisData,
    this.key,
  });

  final EmvqrModel qrisData;

  final Key? key;

  @override
  String toString() {
    return 'QRISPayRouteArgs{qrisData: $qrisData, key: $key}';
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RoomPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInPage();
    },
  );
}
