// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

class FullLinkController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  var imageUrl = ''.obs;
  var isLoading = true.obs;

  Future<void> fetchLinkPreview(String url) async {
    isLoading.value = true;
    try {
      final previewData = await LinkPreview.scrapeFromURL(url);
      if (previewData != null) {
        title.value = previewData.title;
        description.value = previewData.description;
        imageUrl.value = previewData.image;
      } else {
        title.value = 'Failed to fetch link preview';
      }
    } catch (e) {
      title.value = 'Error fetching preview';
    } finally {
      isLoading.value = false;
    }
  }
}
