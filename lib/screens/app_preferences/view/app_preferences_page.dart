import 'package:aidafine/shared/blocs/app_preferences_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_preferences_list.dart';

@RoutePage()
class AppPreferencesPage extends StatelessWidget {
  const AppPreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppPreferencesPage();
  }
}

class _AppPreferencesPage extends StatelessWidget {
  const _AppPreferencesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _AppPreferencesList(),
    );
  }
}
