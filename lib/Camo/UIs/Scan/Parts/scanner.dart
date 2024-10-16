// import 'dart:async';
// import 'dart:developer';

// //import 'package:deshvihar/Screens/Scanning/UIs/Scan/Parts/scan_detection.dart';

// import 'package:camera/camera.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Camo/ScanningController.dart';
// import 'package:flutter_application_2/Camo/Utils/datalists.dart';
// import 'package:flutter_application_2/Camo/Utils/images.dart';
// import 'package:flutter_application_2/Camo/Utils/text.dart';
// import 'package:flutter_application_2/Camo/Widgets/button.dart';
// // import 'package:flutter_tflite/flutter_tflite.dart';
// import 'package:get/get.dart';
// import 'package:tflite/tflite.dart';

// List<CameraDescription>? camera;

// class Scanner extends StatefulWidget {
//   const Scanner({super.key, this.cameraController, required this.changeCamera});
//   final CameraController? cameraController;
//   final Future<void> Function() changeCamera;

//   @override
//   State<Scanner> createState() => _ScannerState();
// }

// int locator = 0;
// String dropdownValue = 'English';

// class _ScannerState extends State<Scanner> {
//   late Timer _timer;
//   bool isfront = true;
//   ScanningController scanningController = Get.put(ScanningController());
//   CameraImage? cameraImage;
//   // ScanningController scanningController = Get.find();
//   // CameraController? cameraController2;
//   String output = '';

//   Future<void> loadCameras() async {
//     print("////loaded cams");
//     print("////loaded cams");
//     print("////loaded cams");
//     setState(() {
//       scanningController.cameracontroller.startImageStream((image) {
//         cameraImage = image;
//       });
//     });
//     // cameraController2 =
//     //     CameraController(camera![0], ResolutionPreset.ultraHigh);
//     // cameraController2!.initialize().then((value) {
//     //   if (!mounted) {
//     //     return;
//     //   } else {
//     //     setState(() {
//     //       cameraController2!.startImageStream((image) {
//     //         cameraImage = image;
//     //       });
//     //     });
//     //   }
//     // });
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
//     print("//////////loaded run model");
//     if (cameraImage != null) {
//       try {
//         log("got camera image");
//         print("got camera image");
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
//   void initState() {
//     loadCameras();
//     loadModel();
//     _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
//       runModel();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             color: Colors.white,
//           ),
//           Positioned(
//               bottom: 0,
//               child: Container(
//                 height: height / 1.05,
//                 width: width,
//                 decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(20))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Row(
//                           children: [
//                             button(
//                               bgcolor: const Color.fromARGB(255, 94, 89, 89),
//                               image: Image.asset(
//                                 close,
//                                 height: 25,
//                                 scale: 3,
//                                 color: Colors.white,
//                                 width: 25,
//                               ),
//                               color: Colors.black,
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                             SizedBox(width: width / 3.7),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 text("Scanning...",
//                                     size: 20, color: Colors.white),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//           //mddle
//           //Scan_Detect(),
//           Positioned(
//               top: 120,
//               child:
//                   // Container(
//                   //   decoration: BoxDecoration(
//                   //       color: bgcolor, borderRadius: BorderRadius.circular(12)),
//                   // )
//                   SizedBox(
//                 height:MediaQuery.of(context).size.height / 1.7,
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: CameraPreview(
//                     scanningController.cameracontroller,
//                   ),
//                 ),
//               )
//               // cameraController2!.value.isInitialized
//               // ?
//               //     AspectRatio(
//               //   aspectRatio: height / 1.7,
//               //   child: CameraPreview(
//               //     widget.cameraController1!,
//               //   ),
//               // )
//               //     Image.asset(
//               //   scan,
//               //   height: height / 1.7,
//               // )
//               ),
//           Positioned(
//               bottom: 95,
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   width: width / 1.5,
//                   height: height / 14,
//                   child: locator == 0
//                       ? Center(
//                           child: text(output,
//                               color: Colors.black, weight: FontWeight.bold),
//                         )
//                       : Center(
//                           child: DropdownButton(
//                             underline: const SizedBox(),
//                             value: dropdownValue,
//                             icon:
//                                 const Icon(Icons.keyboard_arrow_down_outlined),
//                             items: listDropDown,
//                             onChanged: (value) {
//                               setState(() {
//                                 dropdownValue = value!;
//                               });
//                             },
//                           ),
//                         ))),

//           //Down
//           Positioned(
//               bottom: 0,
//               child: Container(
//                 height: height / 10,
//                 width: width,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(20))),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         print('location');
//                         setState(() {
//                           locator = 0;
//                         });
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width / 2.5,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: const Color.fromARGB(255, 28, 39, 76)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   location,
//                                   height: 35,
//                                   width: 35,
//                                 ),
//                                 text("Place",
//                                     weight: FontWeight.w700,
//                                     size: 16,
//                                     color: Colors.white)
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         print('translator');
//                         setState(() {
//                           locator = 1;
//                         });
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width / 2.5,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: const Color.fromARGB(255, 28, 39, 76)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   translator,
//                                   height: 35,
//                                   width: 35,
//                                 ),
//                                 text("Translator",
//                                     weight: FontWeight.w700,
//                                     size: 16,
//                                     color: Colors.white)
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
