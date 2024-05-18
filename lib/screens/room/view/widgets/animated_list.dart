// ignore_for_file: comment_references

import 'dart:developer';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/screens/room/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList({super.key});

  @override
  State<AnimatedChatList> createState() => _AnimatedChatListState();
}

class _AnimatedChatListState extends State<AnimatedChatList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  // Chat? _selectedItem;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(() {
    //   _scrollController.
    // });
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
          // var fixChat = index == 0 && state.answerStreaming != null
          //     ? state.answerStreaming!
          //     : chat;
          late Chat fixChat;
          if (index == 0 && state.answerStreaming != null) {
            fixChat = state.answerStreaming!;
          } else {
            fixChat = chat;
            // fixChat = chat.copyWith(
            //   catalogs: [
            //     Catalog(
            //       id: '0',
            //       name: 'Produk keuangaaan 0',
            //       createdAt: DateTime.now(),
            //     ),
            //     Catalog(
            //       id: '1',
            //       name: 'Produk keuangaaan 1',
            //       createdAt: DateTime.now(),
            //     ),
            //     Catalog(
            //       id: '12',
            //       name: 'Produk keuangaaan 1',
            //       createdAt: DateTime.now(),
            //     ),
            //   ],
            // );
          }

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

  // void _onUpdateScroll(ScrollUpdateNotification event) {
  //   log('event.dragDetails ${event.dragDetails?.delta}');
  //   final position = event.dragDetails?.delta.dy ?? 0;
  //   if (FocusScope.of(context).hasFocus) {
  //     if (position > 20 || position < -20) {
  //       FocusScope.of(context).unfocus();
  //     }
  //   }
  // }

  void _onEndScroll(ScrollEndNotification event) {
    log('event ${event.dragDetails}');
    if (event.dragDetails != null && FocusScope.of(context).hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenPadding = MediaQuery.of(context).padding;
    return BlocListener<RoomBloc, RoomState>(
      listenWhen: (previous, current) =>
          previous.chats.length != current.chats.length,
      listener: (context, state) {
        _insert(state.chats.length);
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // log('scrollNotification ${scrollNotification}');
          if (scrollNotification is ScrollStartNotification) {
            // _onStartScroll(scrollNotification);
          } else if (scrollNotification is ScrollUpdateNotification) {
            // _onUpdateScroll(scrollNotification);
          } else if (scrollNotification is ScrollEndNotification) {
            _onEndScroll(scrollNotification);
          }
          return true;
        },
        child: AnimatedList(
          controller: _scrollController,
          padding: screenPadding.copyWith(bottom: screenPadding.bottom + 80),
          // padding: const EdgeInsets.only(bottom: 80),
          reverse: true,
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
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
