import 'dart:async';

import 'package:aidafine/screens/room/room.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aidafine'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const _ListBubble(),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListBubble extends StatefulWidget {
  const _ListBubble();

  @override
  State<_ListBubble> createState() => _ListBubbleState();
}

class _ListBubbleState extends State<_ListBubble> {
  bool _isSticky = true;
  final _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final stickyHeight = MediaQuery.of(context).size.height;
      _scrollController.addListener(() {
        if (_isSticky && _scrollController.offset > stickyHeight / 3) {
          setState(() {
            _isSticky = false;
          });
        } else if (!_isSticky && _scrollController.offset < stickyHeight / 3) {
          setState(() {
            _isSticky = true;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics:
          _isSticky ? const PageScrollPhysics() : const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 250),
      reverse: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        if (index == 2) {
          return const SizedBox(height: 500);
        }
        if (index.isEven) {
          return const _BubbleAnswer(data: _exampleAnswer);
        }
        return const _BubbleQuestion();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

const _exampleAnswer =
    '''Prescriptive analytics is a form of data analytics that uses past performance and trends to determine what needs to be done to achieve future goals. Even with the obvious benefits, business leaders should understand that prescriptive analytics has its own drawbacks.''';

class _BubbleAnswer extends StatefulWidget {
  const _BubbleAnswer({
    required this.data,
  });

  final String data;

  @override
  State<_BubbleAnswer> createState() => _BubbleAnswerState();
}

class _BubbleAnswerState extends State<_BubbleAnswer>
    with TickerProviderStateMixin {
  late List<String> splittedText = widget.data.split(' ');

  late Timer _timer;
  int _index = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (_index >= splittedText.length) {
        timer.cancel();
      }
      setState(() {
        _index++;
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          for (var i = 0; i < splittedText.length; i++)
            AnimatedScale(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCirc,
              scale: _index >= i ? 1 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _index >= i ? 1 : 0,
                child: Text(
                  '${splittedText[i]} ',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class _BubbleQuestion extends StatelessWidget {
  const _BubbleQuestion();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''What is prescriptive analysis?''',
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
