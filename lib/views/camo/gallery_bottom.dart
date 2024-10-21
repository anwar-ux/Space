import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/camo/gallery_controller.dart';
import 'package:flutter_application_2/utils/images.dart';
import 'package:flutter_application_2/widgets/camo/text.dart';
import 'package:get/get.dart';

class GalleryScreen extends StatelessWidget {
  final GalleryController galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(gallery),
                  const SizedBox(width: 5),
                  text("Dairy", size: 20),
                ],
              ),
            ),

            Expanded(
              child: Obx(() {
                if (galleryController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (galleryController.galleryImages.isEmpty) {
                  return const Center(child: Text("No Images Found"));
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 9 / 16,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: galleryController.galleryImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder<File?>(
                      future: galleryController.galleryImages[index].file,
                      builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          return GestureDetector(
                            onTap: () {
                              galleryController.selectImage(galleryController.galleryImages[index]); // Handle image selection
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(snapshot.data!), // Display the image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            color: Colors.grey.shade300,
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the GalleryScreen as a bottom sheet
void showGalleryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return GalleryScreen();
    },
  );
}
