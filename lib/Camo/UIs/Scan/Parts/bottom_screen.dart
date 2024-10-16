import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/UIs/Camera/camera_file.dart';
import 'package:flutter_application_2/Camo/UIs/Scan/Parts/filters.dart';
import 'package:flutter_application_2/Camo/Utils/images.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Bottom_Screen extends StatefulWidget {
  const Bottom_Screen({super.key, required this.cameraController, required this.changeCamera});
  final CameraController cameraController;
  final Future<void> Function() changeCamera;
  @override
  State<Bottom_Screen> createState() => _Bottom_ScreenState();
}

class _Bottom_ScreenState extends State<Bottom_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 65,
            child: Row(
              children: [
                //Scanner
                SizedBox(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => Scanner(
                      //           changeCamera: widget.changeCamera,
                      //           // cameraController1: widget.cameraController,
                      //         )));
                      Get.snackbar(
                        "Coming soon",
                        "This feature is coming soon",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.grey[700]!,
                        colorText: Colors.white,
                        borderRadius: 10,
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 2),
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        scanner,
                        //color: Colors.white,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                  // onPressed: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => Scanner(
                  //             changeCamera: widget.changeCamera,
                  //             // cameraController1: widget.cameraController,
                  //           )));
                  // },

                  // color: Colors.white,
                  // image: Image.asset(
                  //   scanner,
                  //   height: 50,
                  //   width: 50,
                  // )),
                ),

                const SizedBox(
                  width: 10,
                ),

                //click
                GestureDetector(
                  onTap: () async {
                    if (!widget.cameraController.value.isInitialized) {
                      return;
                    }
                    if (widget.cameraController.value.isTakingPicture) {
                      return;
                    }
                    try {
                      // await widget.cameraController.setFlashMode(FlashMode.auto);
                      XFile file = await widget.cameraController.takePicture();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Camera_File(file: file),
                      ));
                    } on CameraException catch (e) {
                      debugPrint("Error : $e");
                      return;
                    }
                  },
                  child: Image.asset(
                    cameraClick,
                    height: 80,
                    width: 80,
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                //fliters
                SizedBox(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const Filters_Page(),
                      // ));
                      Get.to(() => const ArenaXGamesPage());
                      // Get.snackbar(
                      //   "Coming soon",
                      //   "This feature is coming soon",
                      //   snackPosition: SnackPosition.BOTTOM,
                      //   backgroundColor: Colors.grey[700]!,
                      //   colorText: Colors.white,
                      //   borderRadius: 10,
                      //   margin: const EdgeInsets.all(10),
                      //   duration: const Duration(seconds: 2),
                      //   icon: const Icon(
                      //     Icons.info_outline,
                      //     color: Colors.black,
                      //   ),
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        filter,
                        //color: Colors.white,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
