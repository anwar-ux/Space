import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/Utils/images.dart';
import 'package:flutter_application_2/Camo/Utils/text.dart';
import 'package:flutter_application_2/Camo/get.dart';
import 'package:get/get.dart';

class Camera_File extends StatefulWidget {
  const Camera_File({super.key, required this.file});
  final XFile file;

  @override
  State<Camera_File> createState() => _Camera_FileState();
}

class _Camera_FileState extends State<Camera_File> {
  final ScaffoldController scaffoldController = Get.put<ScaffoldController>(ScaffoldController());

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),

          //image
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 1.05,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    color: Color.fromARGB(255, 28, 39, 76)),
                child: Image.file(
                  picture,
                  fit: BoxFit.fitHeight,
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 12,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: Color.fromARGB(255, 28, 39, 76)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        List<File> pickedFiles = [];
                        setState(() {
                          pickedFiles.add(picture);
                        });
                        // await FirebaseStorageService()
                        //     .uploadMultipleImagesToFirebaseStorage(
                        //         pickedFiles, context);
                     
                        scaffoldController.currentIndex = 3 as RxInt;
                        // Get.offAll(const Bottom_Nav_Page());
                        Get.back();
                        // Get.back();
                      },
                      child: Container(
                        width: width / 2.5,
                        height:45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              add_story,
                              height: 35,
                              width: 35,
                            ),
                            text("Add Story",
                                weight: FontWeight.w700,
                                size: 16,
                                color: const Color.fromARGB(255, 28, 39, 76))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width / 2.5,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 35,
                            width: 35,
                            share,
                          ),
                          text("Send",
                              weight: FontWeight.bold,
                              size: 16,
                              color: const Color.fromARGB(255, 28, 39, 76))
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            top: height / 15,
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
                    color:  const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  close,
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
              ),
            ),
          ),
          Positioned(
            top: height / 15,
            right: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color:  const Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  save,
                  scale: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
