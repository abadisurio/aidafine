import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GenieResultPage extends StatelessWidget {
  const GenieResultPage({
    required this.prompt,
    super.key,
  });

  final String prompt;

  @override
  Widget build(BuildContext context) {
    return _GenieResultView(prompt: prompt);
  }
}

class _GenieResultView extends StatefulWidget {
  const _GenieResultView({
    required this.prompt,
  });

  final String prompt;

  @override
  State<_GenieResultView> createState() => _GenieResultViewState();
}

class _GenieResultViewState extends State<_GenieResultView> {
  @override
  void initState() {
    // context.read<GeminiBloc>().add(Prompt(widget.prompt));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GeminiVoiceBloc, GeminiVoiceState>(
          listenWhen: (prev, curr) {
            return curr.errorMessage != null;
          },
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
            }
          },
        ),
        BlocListener<GeminiVoiceBloc, GeminiVoiceState>(
          listenWhen: (prev, curr) {
            return prev.data != curr.data || curr.dataMap != curr.dataMap;
          },
          listener: (context, state) {
            context.router.maybePop();
          },
        ),
      ],
      child: BlocBuilder<GeminiVoiceBloc, GeminiVoiceState>(
        buildWhen: (prev, curr) {
          return prev.isGeneratingAnswer != curr.isGeneratingAnswer;
        },
        builder: (context, state) {
          if (state.isGeneratingAnswer) {
            return const Scaffold(
              backgroundColor: Colors.black54,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox.square(
                    dimension: 64,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
