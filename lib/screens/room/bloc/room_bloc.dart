import 'dart:developer';

import 'package:aidafine/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.g.dart';
part 'room_bloc.freezed.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(const RoomState()) {
    on<RoomEvent>((event, emit) {});
    _test();
  }

  void _test() {
    log('debug loaddd');
    final key = RemoteConfig.geminiAPIKey;
    log('debug key $key');
  }
}
