part of 'camera_bloc.dart';

class CameraEvent {
  const CameraEvent();
}

class CameraInit extends CameraEvent {
  const CameraInit();
}

class UpdateController extends CameraEvent {
  const UpdateController(this.camera);
  final CameraDescription camera;
}

class Capture extends CameraEvent {
  const Capture();
}

class SwitchCamera extends CameraEvent {
  const SwitchCamera();
}

class ToggleFlash extends CameraEvent {
  const ToggleFlash();
}

class DisposeCamera extends CameraEvent {
  const DisposeCamera();
}
