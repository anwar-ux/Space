import 'package:get/get.dart';

class ScaffoldController extends GetxController {
  // Current index to manage bottom navigation
  var currentIndex = 0.obs; 

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}