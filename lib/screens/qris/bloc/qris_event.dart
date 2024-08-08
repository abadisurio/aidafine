part of 'qris_bloc.dart';

class QRISEvent {
  const QRISEvent();
}

class StartScanningQRIS extends QRISEvent {
  const StartScanningQRIS({required this.cameraController});

  final CameraController cameraController;
}

class DetectQRIS extends QRISEvent {
  const DetectQRIS({required this.image});

  final CameraImage image;
}

class StopScanningQRIS extends QRISEvent {
  const StopScanningQRIS();
}
