import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraControllerX extends GetxController {
  late List<CameraDescription> cameras;
  CameraController? cameraController;

  var isFront = false.obs; 
  var isCameraInitialized = false.obs; 

  @override
  void onInit() {
    super.onInit();
    loadCameras();
  }

  // Load available cameras
  Future<void> loadCameras() async {
    try {
      cameras = await availableCameras();
      // Initialize with the rear camera by default
      initializeCamera(cameras[0]);
    } catch (e) {
      log("Error loading cameras: $e");
    }
  }

  // Initialize the camera
  Future<void> initializeCamera(CameraDescription cameraDescription) async {
    try {
      // Dispose of any existing controller
      if (cameraController != null) {
        await cameraController!.dispose();
      }

      // Initialize the new camera controller
      cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.ultraHigh,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      await cameraController!.initialize();

      // Update the state to show that the camera is initialized
      isCameraInitialized.value = true;
      log("Camera initialized: ${cameraDescription.lensDirection}");
    } catch (e) {
      isCameraInitialized.value = false;
      log("Error initializing camera: $e");
    }
  }

  // Switch between front and rear cameras
  Future<void> switchCamera() async {
    isCameraInitialized.value = false; 
    isFront.value = !isFront.value; 

    // Initialize the camera based on the new direction
    var selectedCamera = cameras[isFront.value ? 1 : 0];
    log("Switching to ${isFront.value ? 'front' : 'rear'} camera");
    
    await initializeCamera(selectedCamera);
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
