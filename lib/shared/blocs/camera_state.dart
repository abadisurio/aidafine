part of 'camera_bloc.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState({
    CameraController? controller,
    List<CameraDescription>? cameras,
    XFile? capturedPicture,
    @Default(0) int cameraNumber,
    @Default(FlashMode.always) FlashMode flashMode,
    @Default(ControllerState.loading) ControllerState controllerState,
  }) = _CameraState;

  const CameraState._();

  CameraController? get currentController => controller;
}

enum ControllerState {
  ready,
  loading,
  empty,
}
