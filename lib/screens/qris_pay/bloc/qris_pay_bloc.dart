import 'package:bloc/bloc.dart';
import 'package:emvqrcode/emvqrcode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qris_pay_event.dart';
part 'qris_pay_state.dart';
part 'qris_pay_bloc.freezed.dart';

class QRISPayBloc extends Bloc<QRISPayEvent, QRISPayState> {
  QRISPayBloc({
    required EmvqrModel qrisData,
  }) : super(QRISPayState(qrisData: qrisData)) {
    on<QRISPayEvent>((event, emit) {
      //
    });
  }
}
