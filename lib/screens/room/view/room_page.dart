import 'package:aidafine/screens/room/room.dart';
import 'package:aidafine/screens/room/view/widgets/recorder.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomBloc(),
      lazy: false,
      child: const _RoomView(),
    );
  }
}

class _RoomView extends StatelessWidget {
  const _RoomView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Aidafine'),
        // ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // const _ListBubble(),
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: const AnimatedChatList(),
            ),
            // Padding(
            //   padding:  EdgeInsets.only(bottom: 100),
            //   child: BubbleCarousel(
            //     catalogs: [

            //     ],
            //   ),
            // ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: _PromptInput(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromptInput extends StatefulWidget {
  const _PromptInput();

  @override
  State<_PromptInput> createState() => _PromptInputState();
}

class _PromptInputState extends State<_PromptInput> {
  final _promptInputController = TextEditingController();
  final _inputFieldNode = FocusNode();
  bool _isPromptEmpty = true;

  @override
  void initState() {
    _promptInputController.addListener(() {
      if (!_isPromptEmpty && _promptInputController.value.text.isEmpty) {
        setState(() {
          _isPromptEmpty = true;
        });
      }
      if (_isPromptEmpty && _promptInputController.value.text.isNotEmpty) {
        setState(() {
          _isPromptEmpty = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<RoomBloc, RoomState>(
            buildWhen: (previous, current) {
              return previous.isLoadingAnswer != current.isLoadingAnswer;
            },
            builder: (context, state) {
              return TextFormField(
                // onTapOutside: (event) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                // },
                focusNode: _inputFieldNode,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                // enabled: !state.isLoadingAnswer,
                controller: _promptInputController,
                cursorHeight: 28,
                cursorRadius: const Radius.circular(12),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                  // suffix: !state.isLoadingAnswer
                  //     ? null
                  //     : const SizedBox.square(
                  //         dimension: 12,
                  //         child: CircularProgressIndicator(),
                  //       ),
                  border: InputBorder.none,
                  hintText: 'Type something',
                ),
              );
            },
          ),
        ),
        Recorder(
          onStop: (path) {
            context.read<RoomBloc>().add(VoicePrompt(path));
          },
        ),
        BlocBuilder<RoomBloc, RoomState>(
          buildWhen: (previous, current) {
            return previous.isLoadingAnswer != current.isLoadingAnswer;
          },
          builder: (context, state) {
            return IconButton(
              onPressed: _isPromptEmpty
                  ? null
                  : () {
                      context
                          .read<RoomBloc>()
                          .add(QueryPrompt(_promptInputController.text));
                      // FocusScope.of(context).unfocus();
                      _promptInputController.clear();

                      // _inputFieldNode.
                    },
              icon: state.isLoadingAnswer
                  ? const CircularProgressIndicator()
                  : const Icon(
                      Icons.send,
                    ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _inputFieldNode.dispose();
    super.dispose();
  }
}
