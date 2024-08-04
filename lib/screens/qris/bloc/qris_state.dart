part of 'qris_bloc.dart';

@freezed
class QRISState with _$QRISState {
  const factory QRISState({
    double? amount,
    String? errorMessage,
  }) = _QRISState;
}
