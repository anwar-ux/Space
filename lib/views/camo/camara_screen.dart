import 'dart:io' show Platform;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/camo/camera_controller.dart';
import 'package:flutter_application_2/views/camo/gallery_bottom.dart';
import 'package:flutter_application_2/widgets/camo/bottom_screen.dart';
import 'package:flutter_application_2/widgets/camo/top_screen.dart';
import 'package:flutter_application_2/Camo/Utils/colors.dart';
import 'package:flutter_application_2/utils/images.dart';
import 'package:get/get.dart';

class CameraScreen extends StatelessWidget {
  final CameraControllerX cameraControllerX = Get.put(CameraControllerX());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Obx(() {
        if (!cameraControllerX.isCameraInitialized.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            cameraControllerX.cameraController == null
                ? Container(
                    decoration: BoxDecoration(
                      color: bgcolor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                : GestureDetector(
                    onDoubleTap: () async {
                      await cameraControllerX.switchCamera();
                    },
                    child: Builder(builder: (BuildContext builder) {
                      var camera = cameraControllerX.cameraController!.value;
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
                          child: Center(child: CameraPreview(cameraControllerX.cameraController!)),
                        ),
                      );
                    }),
                  ),
            Top_screen(
              cameras: cameraControllerX.cameras,
              changeCamera: () async {
                await cameraControllerX.switchCamera();
              },
              cameraController: cameraControllerX.cameraController!,
              onCameraSwitched: () {
                cameraControllerX.switchCamera();
              },
            ),
            Bottom_Screen(
              changeCamera: () async {
                await cameraControllerX.switchCamera();
              },
              cameraController: cameraControllerX.cameraController!,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xFF1C274C),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    showGalleryBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(gallery),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
