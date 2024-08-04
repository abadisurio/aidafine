import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CameraInit>(_onCameraInit);
    on<UpdateController>(_onUpdateController);
    on<SwitchCamera>(_onSwitchCamera);
    on<ToggleFlash>(_onToggleFlash);
    on<Capture>(_onCapture);
    on<DisposeCamera>(_onDisposeCamera);
  }

  Future<void> _onCameraInit(
    CameraInit event,
    Emitter<CameraState> emit,
  ) async {
    emit(
      state.copyWith(controllerState: ControllerState.loading),
    );
    final cameras = await _getCameras();
    final controller = await _updateCameraController(
      cameras?[state.cameraNumber],
    );
    emit(
      state.copyWith(
        cameras: cameras,
        controller: controller,
        controllerState: ControllerState.ready,
      ),
    );
  }

  Future<void> _onUpdateController(
    UpdateController event,
    Emitter<CameraState> emit,
  ) async {
    final newController = await _updateCameraController(event.camera);

    emit(
      state.copyWith(
        controller: newController,
        controllerState: ControllerState.ready,
      ),
    );
  }

  Future<void> _onSwitchCamera(
    SwitchCamera event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(controllerState: ControllerState.loading));
    await state.controller?.dispose();
    final newCameraNumber = state.cameraNumber == 0 ? 1 : 0;
    final newController =
        await _updateCameraController(state.cameras?[newCameraNumber]);

    emit(
      state.copyWith(
        controller: newController,
        cameraNumber: newCameraNumber,
        controllerState: ControllerState.ready,
      ),
    );
  }

  Future<void> _onToggleFlash(
    ToggleFlash event,
    Emitter<CameraState> emit,
  ) async {
    log('togleeee');
    late FlashMode mode;
    switch (state.currentController?.value.flashMode) {
      case FlashMode.auto:
      case FlashMode.always:
        mode = FlashMode.off;
      case FlashMode.off:
        mode = FlashMode.always;
      case FlashMode.torch:
        break;
      case null:
        break;
    }
    await state.controller!.setFlashMode(mode);

    emit(state.copyWith(flashMode: mode));
  }

  Future<void> _onCapture(
    Capture event,
    Emitter<CameraState> emit,
  ) async {
    // state.contr
    log('debug heree');
    final picture = await state.controller!.takePicture();

    emit(state.copyWith(capturedPicture: picture));
  }

  Future<void> _onDisposeCamera(
    DisposeCamera event,
    Emitter<CameraState> emit,
  ) async {
    await Future.delayed(Durations.medium3, () {});
    await state.controller?.dispose();
    emit(
      state.copyWith(
        controllerState: ControllerState.empty,
        controller: null,
      ),
    );
  }

  Future<CameraController?> _updateCameraController(
    CameraDescription? camera,
  ) async {
    if (camera == null) return null;

    final cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await cameraController.initialize();
      cameraController.value = cameraController.value.copyWith(
        previewSize: const Size(1600, 1200),
        flashMode: FlashMode.always,
      );
      // if (!cameraController.value.isInitialized) {
      //   throw Exception('Camera is not initialized.');
      // }
      // await Future.wait(<Future<Object?>>[
      //   // The exposure mode is currently not supported on the web.
      //   ...!kIsWeb
      //       ? <Future<Object?>>[
      //           cameraController.getMinExposureOffset().then(
      //               (double value) => _minAvailableExposureOffset = value),
      //           cameraController
      //               .getMaxExposureOffset()
      //       .then((double value) => _maxAvailableExposureOffset = value)
      //         ]
      //       : <Future<Object?>>[],
      //   cameraController
      //       .getMaxZoomLevel()
      //       .then((double value) => _maxAvailableZoom = value),
      //   cameraController
      //       .getMinZoomLevel()
      //       .then((double value) => _minAvailableZoom = value),
      // ]);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          throw Exception('You have denied camera access.');

        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          throw Exception('Please go to Settings app to enable camera access.');

        case 'CameraAccessRestricted':
          // iOS only
          throw Exception('Camera access is restricted.');

        case 'AudioAccessDenied':
          throw Exception('You have denied audio access.');

        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          throw Exception('Please go to Settings app to enable audio access.');

        case 'AudioAccessRestricted':
          // iOS only
          throw Exception('Audio access is restricted.');

        default:
          _showCameraException(e);
          break;
      }
    }

    if (!cameraController.value.isInitialized) {
      throw Exception('Camera is not initialized.');
    }
    return cameraController;
  }

  Future<List<CameraDescription>?> _getCameras() async {
    try {
      return availableCameras();
    } on CameraException catch (e) {
      _logError(e.code, e.description);
      return null;
    }
  }

  void dispose() {
    state.currentController?.dispose();
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
  }
}
