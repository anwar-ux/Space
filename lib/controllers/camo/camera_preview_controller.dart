import 'dart:io';
import 'package:get/get.dart';

class CameraPreviewController extends GetxController {
  File? pictureFile; // Store the picture file
  var pickedFiles = <File>[].obs; // Use RxList for reactive state management

  void initialize(File file) {
    pictureFile = file;
    update(); // Notify the UI to update
  }

  // Handle adding file to pickedFiles list
  void addFileToPickedFiles(File file) {
    pickedFiles.add(file);
    update(); // Notify the UI
  }

  // This function simulates uploading files (you can replace it with real functionality)
  Future<void> uploadFiles() async {
    if (pickedFiles.isNotEmpty) {
      // Simulate the upload logic here
      // You can call your Firebase or other storage methods
      // For now, just log the picked files
      for (var file in pickedFiles) {
        print("Uploading: ${file.path}");
      }
    }
  }
}
