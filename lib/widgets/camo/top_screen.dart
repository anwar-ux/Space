
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/images.dart';

class Top_screen extends StatefulWidget {
  Top_screen(
      {super.key,
      required this.cameraController,
      required this.changeCamera,
      required this.cameras,
      required this.onCameraSwitched});
  CameraController cameraController;
  final List<CameraDescription> cameras;
  final Future<void> Function() changeCamera;
  final VoidCallback onCameraSwitched;

  @override
  State<Top_screen> createState() => _Top_screenState();
}

class _Top_screenState extends State<Top_screen> {
  bool ison = false;
  bool isfront = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 10,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  close,
                  height: 10,
                  width: 10,
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 15,
            child: GestureDetector(
              onTap: () async {
                try {
                  isfront = !isfront;
                  await widget.changeCamera();
                  // widget.onCameraSwitched();
                } catch (e) {
                  print("Exeption : $e");
                }
              },
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                 camera,
                  height: 10,
                  width: 10,
                ),
              ),
            )),
        Positioned(
            top: 60,
            right: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  ison = !ison;
                });
                ison
                    ? widget.cameraController.setFlashMode(FlashMode.torch)
                    : widget.cameraController.setFlashMode(FlashMode.off);
                //_switchlight();
              },
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  flash,
                  //color: Colors.white,
                  height: 10,
                  width: 10,
                ),
              ),
            )),
      ],
    );
  }
}
