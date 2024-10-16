// import 'dart:developer';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';

// late List<CameraDescription> _cameras;

// List<CameraDescription> getCameras() {
//   return _cameras;
// }

// class Scan_Detect extends StatefulWidget {
//   const Scan_Detect({super.key});

//   @override
//   State<Scan_Detect> createState() => _Scan_DetectState();
// }



// class _Scan_DetectState extends State<Scan_Detect> {

//   @override
//   void initState() {
//      loadCameras();
//     loadModel();
//     runModel();
//     super.initState();

//   }

//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   loadCameras() async {
//     log("loaded cams");
//     cameraController = CameraController(_cameras[0], ResolutionPreset.ultraHigh);
//     cameraController!.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           cameraController!.startImageStream((image) {
//             cameraImage = image;
//           });
//         });
//       }
//     });
//   }

//   loadModel() async {
//     try {
//       await Tflite.loadModel(
//               model: "assets/machine_learning/rice.tflite",
//               labels: "assets/machine_learning/labels.txt")
//           .onError((error, stackTrace) {
//         log(error.toString());
//         log(stackTrace.toString());
//         return null;
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   runModel() async {
//     log("loaded run model");
//     if (cameraImage != null) {
//       try {
//         log("got camera image");
//         var predictions = await Tflite.runModelOnFrame(
//             bytesList: cameraImage!.planes.map((e) {
//               return e.bytes;
//             }).toList(),
//             imageHeight: cameraImage!.height,
//             imageWidth: cameraImage!.width,
//             imageMean: 127.5,
//             imageStd: 127.5,
//             rotation: 90,
//             numResults: 2,
//             threshold: 0.1,
//             asynch: true);
//         for (var element in predictions!) {
//           setState(() {
//             log("message");
//             output = element['label'].toString();
//           });
//         }
//       } catch (e) {
//         log(e.toString());
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }