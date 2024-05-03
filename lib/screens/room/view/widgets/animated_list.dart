// ignore_for_file: comment_references

import 'package:aidafine/screens/room/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedListSample extends StatefulWidget {
  const AnimatedListSample({super.key});

  @override
  State<AnimatedListSample> createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  // Chat? _selectedItem;

  @override
  void initState() {
    super.initState();

    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (context, state) {
        final chat = state.chats[state.chats.length - 1 - index];
        if (chat.username == 'gemini') {
          final fixChat = index == 0 && state.answerStreaming != null
              ? state.answerStreaming!
              : chat;
          return SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Easing.emphasizedDecelerate,
            ),
            child: BubbleAnswer(chat: fixChat),
          );
        }
        return SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Easing.emphasizedDecelerate,
          ),
          child: BubbleQuestion(chat: chat),
        );
      },
    );
  }

  /// The builder function used to build items that have been removed.
  ///
  /// Used to build an item after it has been removed from the list. This method
  /// is needed because a removed item remains visible until its animation has
  /// completed (even though it's gone as far as this ListModel is concerned).
  /// The widget will be used by the [AnimatedListState.removeItem] method's
  /// [AnimatedRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
    int index,
    BuildContext context,
    Animation<double> animation,
  ) {
    final removedItem = context.read<RoomBloc>().state.chats[index];
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCirc,
      ),
      child: BubbleQuestion(chat: removedItem),
    );
  }

  // Insert the "next item" into the list model.
  void _insert(int newIndex) {
    _list.insert(0, newIndex);
  }

  // Remove the selected item from the list model.
  // void _remove() {
  //   if (_selectedItem != null) {
  //     _list.removeAt(_list.indexOf(_selectedItem!));
  //     setState(() {
  //       _selectedItem = null;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenPadding = MediaQuery.of(context).padding;
    return BlocListener<RoomBloc, RoomState>(
      listenWhen: (previous, current) =>
          previous.chats.length != current.chats.length,
      listener: (context, state) {
        _insert(state.chats.length);
      },
      child: AnimatedList(
        padding: screenPadding.copyWith(bottom: screenPadding.bottom + 80),
        // padding: const EdgeInsets.only(bottom: 80),
        reverse: true,
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: _buildItem,
      ),
    );
  }
}

typedef RemovedItemBuilder<T> = Widget Function(
  T item,
  BuildContext context,
  Animation<double> animation,
);

/// Keeps a Dart [List] in sync with an [AnimatedList].
///
/// The [insert] and [removeAt] methods apply to both the internal list and
/// the animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that
/// mutate the list must make the same changes to the animated list in terms
/// of [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(
      index,
      duration: const Duration(
        milliseconds: 700,
      ),
    );
  }

  E removeAt(int index) {
    final removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}
