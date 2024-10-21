// gallery_controller.dart
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart'; // For accessing device images
import 'dart:io'; // For handling file

class GalleryController extends GetxController {
  RxList<AssetEntity> galleryImages = <AssetEntity>[].obs;
  RxBool isLoading = false.obs;
  RxBool hasPermission = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null); // To store selected image

  @override
  void onInit() {
    super.onInit();
    fetchGalleryImages();
  }

  Future<void> fetchGalleryImages() async {
  isLoading(true); 
  
  // Request permissions to access the media gallery
  final PermissionState ps = await PhotoManager.requestPermissionExtend();
  
  if (ps.isAuth) {
    hasPermission(true); 
    
    // Fetch all albums
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      hasAll: true,
    );
    
    for (var album in albums) {
      print("Album Name: ${album.name}");
    }

    AssetPathEntity? recentAlbum = albums.firstWhere(
      (album) => album.isAll || album.name.toLowerCase() == "recent",
      orElse: () => albums.first,
    );

    List<AssetEntity> images = await recentAlbum.getAssetListPaged(page: 0, size: 100);
    
    galleryImages(images);
    } else {
    await PhotoManager.requestPermissionExtend();
  }

  isLoading(false); 
}


  // Function to set the selected image and navigate to the camera preview screen
  Future<void> selectImage(AssetEntity image) async {
    final File? file = await image.file;
    if (file != null) {
      selectedImage(file);
      Get.toNamed('/camera-preview', arguments: file.path); // Navigate to the camera preview screen
    }
  }
}
