import 'package:aidafine/shared/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoRouter(navigatorObservers: () => []),
        const GenieWidget(),
      ],
    );
  }
}
