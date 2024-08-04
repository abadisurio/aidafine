import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QRISBloc extends Bloc<QRISEvent, QRISState> {
  QRISBloc({double? amount}) : super(QRISState(amount: amount)) {
    on<QRISEvent>((event, emit) {
      //
    });
  }
}
