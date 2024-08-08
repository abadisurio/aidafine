part of 'qris_bloc.dart';

@freezed
class QRISState with _$QRISState {
  const factory QRISState({
    @Default(false) bool isScanning,
    EmvqrModel? data,
    double? amount,
    String? errorMessage,
  }) = _QRISState;
}
