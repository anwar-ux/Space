import 'package:get/get.dart';

class HomeController extends GetxController {
  var showHorizontalList = false.obs; // Observable variable for visibility

  void toggleHorizontalList() {
    showHorizontalList.value = !showHorizontalList.value;
  }

  void show() {
    showHorizontalList.value = true;
  }

  void hide() {
    showHorizontalList.value = false;
  }
}
