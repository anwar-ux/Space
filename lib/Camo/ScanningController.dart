
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class ScanningController extends GetxController {
  late List<CameraDescription> cameras;

  List<CameraDescription> getCameras() {
    return cameras;
  }

  @override
  void onInit() async {
    super.onInit();
    cameras = await availableCameras();
    splitCamera(frontcamera: false);
  }

  late CameraController cameracontroller;
  Future<void> splitCamera({required bool frontcamera}) async {
    cameracontroller =
        CameraController(cameras[(frontcamera) ? 1 : 0], ResolutionPreset.max);
    cameracontroller.initialize().then((_) {
      // if (!mounted) {
      //   return;
      // }
      // setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }
}
