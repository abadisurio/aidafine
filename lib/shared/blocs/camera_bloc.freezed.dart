// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraState {
  CameraController? get controller => throw _privateConstructorUsedError;
  List<CameraDescription>? get cameras => throw _privateConstructorUsedError;
  XFile? get capturedPicture => throw _privateConstructorUsedError;
  int get cameraNumber => throw _privateConstructorUsedError;
  FlashMode get flashMode => throw _privateConstructorUsedError;
  ControllerState get controllerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
  @useResult
  $Res call(
      {CameraController? controller,
      List<CameraDescription>? cameras,
      XFile? capturedPicture,
      int cameraNumber,
      FlashMode flashMode,
      ControllerState controllerState});
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? cameras = freezed,
    Object? capturedPicture = freezed,
    Object? cameraNumber = null,
    Object? flashMode = null,
    Object? controllerState = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: freezed == cameras
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      capturedPicture: freezed == capturedPicture
          ? _value.capturedPicture
          : capturedPicture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      cameraNumber: null == cameraNumber
          ? _value.cameraNumber
          : cameraNumber // ignore: cast_nullable_to_non_nullable
              as int,
      flashMode: null == flashMode
          ? _value.flashMode
          : flashMode // ignore: cast_nullable_to_non_nullable
              as FlashMode,
      controllerState: null == controllerState
          ? _value.controllerState
          : controllerState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraStateImplCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$$CameraStateImplCopyWith(
          _$CameraStateImpl value, $Res Function(_$CameraStateImpl) then) =
      __$$CameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraController? controller,
      List<CameraDescription>? cameras,
      XFile? capturedPicture,
      int cameraNumber,
      FlashMode flashMode,
      ControllerState controllerState});
}

/// @nodoc
class __$$CameraStateImplCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$CameraStateImpl>
    implements _$$CameraStateImplCopyWith<$Res> {
  __$$CameraStateImplCopyWithImpl(
      _$CameraStateImpl _value, $Res Function(_$CameraStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? cameras = freezed,
    Object? capturedPicture = freezed,
    Object? cameraNumber = null,
    Object? flashMode = null,
    Object? controllerState = null,
  }) {
    return _then(_$CameraStateImpl(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: freezed == cameras
          ? _value._cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      capturedPicture: freezed == capturedPicture
          ? _value.capturedPicture
          : capturedPicture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      cameraNumber: null == cameraNumber
          ? _value.cameraNumber
          : cameraNumber // ignore: cast_nullable_to_non_nullable
              as int,
      flashMode: null == flashMode
          ? _value.flashMode
          : flashMode // ignore: cast_nullable_to_non_nullable
              as FlashMode,
      controllerState: null == controllerState
          ? _value.controllerState
          : controllerState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
    ));
  }
}

/// @nodoc

class _$CameraStateImpl extends _CameraState {
  const _$CameraStateImpl(
      {this.controller,
      final List<CameraDescription>? cameras,
      this.capturedPicture,
      this.cameraNumber = 0,
      this.flashMode = FlashMode.always,
      this.controllerState = ControllerState.loading})
      : _cameras = cameras,
        super._();

  @override
  final CameraController? controller;
  final List<CameraDescription>? _cameras;
  @override
  List<CameraDescription>? get cameras {
    final value = _cameras;
    if (value == null) return null;
    if (_cameras is EqualUnmodifiableListView) return _cameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final XFile? capturedPicture;
  @override
  @JsonKey()
  final int cameraNumber;
  @override
  @JsonKey()
  final FlashMode flashMode;
  @override
  @JsonKey()
  final ControllerState controllerState;

  @override
  String toString() {
    return 'CameraState(controller: $controller, cameras: $cameras, capturedPicture: $capturedPicture, cameraNumber: $cameraNumber, flashMode: $flashMode, controllerState: $controllerState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            const DeepCollectionEquality().equals(other._cameras, _cameras) &&
            (identical(other.capturedPicture, capturedPicture) ||
                other.capturedPicture == capturedPicture) &&
            (identical(other.cameraNumber, cameraNumber) ||
                other.cameraNumber == cameraNumber) &&
            (identical(other.flashMode, flashMode) ||
                other.flashMode == flashMode) &&
            (identical(other.controllerState, controllerState) ||
                other.controllerState == controllerState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      controller,
      const DeepCollectionEquality().hash(_cameras),
      capturedPicture,
      cameraNumber,
      flashMode,
      controllerState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      __$$CameraStateImplCopyWithImpl<_$CameraStateImpl>(this, _$identity);
}

abstract class _CameraState extends CameraState {
  const factory _CameraState(
      {final CameraController? controller,
      final List<CameraDescription>? cameras,
      final XFile? capturedPicture,
      final int cameraNumber,
      final FlashMode flashMode,
      final ControllerState controllerState}) = _$CameraStateImpl;
  const _CameraState._() : super._();

  @override
  CameraController? get controller;
  @override
  List<CameraDescription>? get cameras;
  @override
  XFile? get capturedPicture;
  @override
  int get cameraNumber;
  @override
  FlashMode get flashMode;
  @override
  ControllerState get controllerState;
  @override
  @JsonKey(ignore: true)
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
