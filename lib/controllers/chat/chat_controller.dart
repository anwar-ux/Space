import 'package:get/get.dart';

class ChatController extends GetxController {
  var isBottomSheetVisible = false.obs; // Observable for bottom sheet visibility

  void toggleBottomSheet() {
    isBottomSheetVisible.value = !isBottomSheetVisible.value; // Toggle the visibility
  }
}
