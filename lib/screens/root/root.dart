import 'package:aidafine/shared/blocs/gemini_voice_bloc/gemini_voice_bloc.dart';
import 'package:aidafine/shared/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeminiVoiceBloc, GeminiVoiceState>(
      listenWhen: (prev, curr) {
        return prev.errorMessage != curr.errorMessage;
      },
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
            ),
          );
        }
      },
      child: Stack(
        children: [
          AutoRouter(navigatorObservers: () => []),
          const GenieWidgetContainer(),
        ],
      ),
    );
  }
}
