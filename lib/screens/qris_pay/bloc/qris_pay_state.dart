part of 'qris_pay_bloc.dart';

@freezed
class QRISPayState with _$QRISPayState {
  const factory QRISPayState({
    required EmvqrModel qrisData,
    @Default(false) bool isScanning,
    double? amount,
    String? errorMessage,
  }) = _QRISPayState;
}
