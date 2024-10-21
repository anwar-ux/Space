import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui; // Import for ui.Image
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/controllers/camo/camera_preview_controller.dart';
import 'package:flutter_application_2/utils/images.dart';
import 'package:flutter_application_2/widgets/camo/text.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart' as path;

class CameraPreviewScreen extends StatelessWidget {
  final CameraPreviewController cameraFileController = Get.put(CameraPreviewController());

  final XFile file; // Pass the file to the widget
  final GlobalKey _globalKey = GlobalKey(); // Global key for accessing the widget's context

  CameraPreviewScreen({Key? key, required this.file}) : super(key: key) {
    cameraFileController.initialize(File(file.path)); // Initialize with the file
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder<CameraPreviewController>(builder: (controller) {
        File? picture = controller.pictureFile;

        return Stack(
          children: [
            Container(
              color: Colors.black,
            ),

            // Image display
            Positioned(
              bottom: 0,
              child: Container(
                height: height / 1.05,
                width: width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Color.fromARGB(255, 28, 39, 76),
                ),
                child: picture != null
                    ? RepaintBoundary( // Wrap with RepaintBoundary
                        key: _globalKey,
                        child: Image.file(
                          picture,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),

            // Bottom Buttons
            Positioned(
              bottom: 0,
              child: Container(
                height: height / 12,
                width: width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Color.fromARGB(255, 28, 39, 76),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Add Story Button
                    GestureDetector(
                      onTap: () {
                        if (picture != null) {
                          controller.addFileToPickedFiles(picture);
                          Get.back(); // Navigate back after adding
                        }
                      },
                      child: Container(
                        width: width / 2.5,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              add_story,
                              height: 35,
                              width: 35,
                            ),
                            text(
                              "Add Story",
                              weight: FontWeight.w700,
                              size: 16,
                              color: const Color.fromARGB(255, 28, 39, 76),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Send Button
                    GestureDetector(
                      onTap: () async {
                        await controller.uploadFiles(); // Simulate file upload
                      },
                      child: Container(
                        width: width / 2.5,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              height: 35,
                              width: 35,
                              share,
                            ),
                            text(
                              "Send",
                              weight: FontWeight.bold,
                              size: 16,
                              color: const Color.fromARGB(255, 28, 39, 76),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Back Button
            Positioned(
              top: height / 15,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Get.back(); // Navigate back
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    close,
                    color: Colors.white,
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ),

            // Save Local Image Button
            Positioned(
              top: height / 15,
              right: 15,
              child: GestureDetector(
                onTap: () async {
                  await _saveLocalImage(); // Save the local image
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.save, color: Colors.white), // Use an icon for clarity
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Function to save the local image
  Future<void> _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      Get.snackbar("Success", "Image saved to gallery");
    } else {
      Get.snackbar("Error", "Failed to convert image");
    }
  }
}