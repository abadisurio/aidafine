import 'dart:async';
import 'package:aidafine/shared/shared.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:emvqrcode/emvqrcode.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QRISBloc extends Bloc<QRISEvent, QRISState> {
  QRISBloc({double? amount}) : super(QRISState(amount: amount)) {
    on<StartScanningQRIS>(_onStartScanningQRIS);
    on<DetectQRIS>(_onDetectQRIS);
    on<StopScanningQRIS>(_onStopScanningQRIS);
  }

  CameraController? _cameraController;
  CameraImage? _image;
  BarcodeScanner? _barcodeScanner;
  Timer? _qrisCapturer;

  void _onStartScanningQRIS(
    StartScanningQRIS event,
    Emitter<QRISState> emit,
  ) {
    _barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.qrCode]);
    _cameraController = event.cameraController;
    emit(state.copyWith(isScanning: true));
    _cameraController?.startImageStream((CameraImage image) {
      _image = image;
    });
    _qrisCapturer = Timer.periodic(Durations.long2, (Timer t) async {
      // log('debug image ${t.tick}');
      // _processCameraImage(_image!);
      if (_image != null && _cameraController != null) {
        add(DetectQRIS(image: _image!));
      }
    });
  }

  Future<void> _onDetectQRIS(
    DetectQRIS event,
    Emitter<QRISState> emit,
  ) async {
    if (_cameraController == null) return;
    final inputImage = getInputImage(
      cameraImage: event.image,
      cameraController: _cameraController!,
      // camera:
    );
    if (inputImage == null) return;
    final barcodes = await _barcodeScanner?.processImage(inputImage);
    final qrValue = barcodes?.firstOrNull?.rawValue;

    if (qrValue == null) return;
    final emvdecode = EMVMPM.decode(qrValue).emvqr;
    if (emvdecode == null) return;
    // _isQRISDetected = true;
    emit(state.copyWith(data: emvdecode));
    add(const StopScanningQRIS());
  }

  void _onStopScanningQRIS(
    StopScanningQRIS event,
    Emitter<QRISState> emit,
  ) {
    if (state.data == null) return;
    _cameraController?.stopImageStream();
    _qrisCapturer?.cancel();
    _cameraController = null;
    _image = null;
    _qrisCapturer = null;
    // _isQRISDetected = false;
    emit(state.copyWith(isScanning: false, data: null));
  }
}
