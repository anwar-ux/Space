// ignore_for_file: camel_case_types
import 'dart:developer';
import 'dart:io' show Platform;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/UIs/Gallery/main_screen.dart';
import 'package:flutter_application_2/Camo/UIs/Scan/Parts/bottom_screen.dart';
import 'package:flutter_application_2/Camo/UIs/Scan/Parts/top_screen.dart';
import 'package:flutter_application_2/Camo/Utils/colors.dart';
import 'package:flutter_application_2/Camo/Utils/images.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

late List<CameraDescription> _cameras;
late CameraController? _cameracontroller;

class Camara_Screen extends StatefulWidget {
  const Camara_Screen({
    super.key,
  });

  @override
  State<Camara_Screen> createState() => _Camara_ScreenState();
}

class _Camara_ScreenState extends State<Camara_Screen> {
  bool isfront = true;
  bool camerainit = false;

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );

  Future<void> splitCamera() async {
    isfront = !isfront;
    camerainit = true;
    log("isfront $isfront");
    log("isfront $isfront");
    await _cameracontroller?.dispose();

    _cameracontroller = CameraController(
      _cameras[isfront ? 1 : 0],
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _cameracontroller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  Future<void> loadcameras() async {
    _cameras = await availableCameras();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<CameraController> _initializeCameraController() async {
    _cameras = await availableCameras();
    if (camerainit == true) {
      if (_cameracontroller != null) {
        return _cameracontroller!;
      }
    }
    _cameracontroller = CameraController(
      _cameras[0],
      ResolutionPreset.medium,
    );
    await _cameracontroller!.initialize();
    return _cameracontroller!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_cameracontroller != null) {
      _cameracontroller!.dispose();
    }
    _faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: FutureBuilder(
          future: _initializeCameraController(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // ignore: unnecessary_null_comparison
                  _cameracontroller == null
                      ? Container(
                          decoration: BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(12)),
                        )
                      : GestureDetector(
                          //change camera sides
                          onDoubleTap: () async {
                            isfront = !isfront;
                            setState(() {
                              splitCamera();
                            });
                          },
                          child: Builder(builder: (BuildContext builder) {
                            var camera = _cameracontroller!.value;
                            final fullSize = MediaQuery.of(context).size;
                            final size = Size(fullSize.width, fullSize.height - (Platform.isIOS ? 90 : 0));
                            double scale;
                            try {
                              scale = size.aspectRatio * camera.aspectRatio;
                            } catch (e) {
                              scale = 1.0;
                            }
                            if (scale < 1) scale = 1 / scale;
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Transform.scale(
                                scale: scale,
                                child: Center(child: CameraPreview(_cameracontroller!)),
                              ),
                            );
                          }),
                        ),
                  Top_screen(
                      cameras: _cameras,
                      changeCamera: splitCamera,
                      cameraController: _cameracontroller!,
                      onCameraSwitched: () {
                        setState(() {
                          splitCamera();
                        });
                      }),
                  Bottom_Screen(changeCamera: splitCamera, cameraController: _cameracontroller!),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: const BoxDecoration(
                            color: Color(0xFF1C274C), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                        child: GestureDetector(
                          onTap: () {
                            showGalleryBottomSheet(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(gallery),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              // text(
                              //   "Dairy",
                              //   size: 20,

                              // )
                            ],
                          ),
                        ),
                      ))

                  // scanner
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
/*
                   Container(
                    height: height / 1,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: CameraPreview(widget.cameraController!),
                  )*/