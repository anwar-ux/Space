import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/UIs/FilterCamera/FiltersUI/FaceDetectorPainter.dart';
import 'package:flutter_application_2/Camo/UIs/FilterCamera/camera_view.dart';
import 'package:flutter_application_2/Camo/UIs/FilterCamera/gallery_view.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FilterCameraPage extends StatefulWidget {
  const FilterCameraPage({super.key});

  @override
  State<FilterCameraPage> createState() => _FilterCameraPageState();
}

class _FilterCameraPageState extends State<FilterCameraPage> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.front;
  final _processingController = StreamController<bool>.broadcast();
  late StreamSubscription<bool> _subs;
  bool _shouldUpdate = false;

  @override
  void initState() {
    _subs = _processingController.stream.listen((updating) {
      setState(() {
        _shouldUpdate = updating;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetectorView(
      title: 'Face Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: _processImage,
      initialCameraLensDirection: _cameraLensDirection,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) {
      log('Cannot process');
      return;
    }
    if (_isBusy) {
      log('Is busy');
      return;
    }
    _isBusy = true;
    try {
      final faces = await _faceDetector.processImage(inputImage);
      if (faces.isEmpty) {
        log('No faces detected');
        return;
      }
      final numberOfFaces = faces.length;
      log('$numberOfFaces face(s) detected');
      final imageSize = Size(
        inputImage.metadata?.size.width ?? 0.0,
        inputImage.metadata?.size.height ?? 0.0,
      );
      setState(() {
        _customPaint = CustomPaint(
          painter: FaceDetectorPainter(
            faces,
            imageSize,
            inputImage.metadata?.rotation ?? InputImageRotation.rotation0deg,
            _cameraLensDirection,
          ),
        );
        // _customPaint = CustomPaint(
        //   painter: MaskFilter(
        //     faces,
        //     imageSize,
        //     inputImage.metadata?.rotation ?? InputImageRotation.rotation0deg,
        //     _cameraLensDirection,
        //   ),
        // );
      });

      for (final face in faces) {
        log('Face detected at ${face.boundingBox}');
      }
    } catch (e) {
      log('Failed to detect faces: $e');
    } finally {
      _isBusy = false;
    }
  }
}

enum DetectorViewMode { liveFeed, gallery }

class DetectorView extends StatefulWidget {
  const DetectorView({
    Key? key,
    required this.title,
    required this.onImage,
    this.customPaint,
    this.text,
    this.initialDetectionMode = DetectorViewMode.liveFeed,
    this.initialCameraLensDirection = CameraLensDirection.back,
    this.onCameraFeedReady,
    this.onDetectorViewModeChanged,
    this.onCameraLensDirectionChanged,
  }) : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final DetectorViewMode initialDetectionMode;
  final Function(InputImage inputImage) onImage;
  final Function()? onCameraFeedReady;
  final Function(DetectorViewMode mode)? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;

  @override
  State<DetectorView> createState() => _DetectorViewState();
}

class _DetectorViewState extends State<DetectorView> {
  late DetectorViewMode _mode;

  @override
  void initState() {
    _mode = widget.initialDetectionMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _mode == DetectorViewMode.liveFeed
        ? CameraView(
            customPaint: widget.customPaint,
            onImage: widget.onImage,
            onCameraFeedReady: widget.onCameraFeedReady,
            onDetectorViewModeChanged: _onDetectorViewModeChanged,
            initialCameraLensDirection: widget.initialCameraLensDirection,
            onCameraLensDirectionChanged: widget.onCameraLensDirectionChanged,
          )
        : GalleryView(
            title: widget.title,
            text: widget.text,
            onImage: widget.onImage,
            onDetectorViewModeChanged: _onDetectorViewModeChanged);
  }

  void _onDetectorViewModeChanged() {
    if (_mode == DetectorViewMode.liveFeed) {
      _mode = DetectorViewMode.gallery;
    } else {
      _mode = DetectorViewMode.liveFeed;
    }
    if (widget.onDetectorViewModeChanged != null) {
      widget.onDetectorViewModeChanged!(_mode);
    }
    setState(() {});
  }
}
