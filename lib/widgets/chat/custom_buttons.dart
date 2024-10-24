import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/views/camo/camara_screen.dart';
import 'package:flutter_application_2/views/camo/gallery_bottom.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function(BuildContext)? action; // Accept context in the action

  CustomButton({
    super.key,
    required this.icon,
    required this.color,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action?.call(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
      ),
    );
  }
}

// Example list of buttons with context
List<CustomButton> buildButtons(BuildContext context) {
  return [
    CustomButton(
      icon: Icons.camera,
      color: AppColor.lightGrey,
      action: (ctx) => Get.to(CameraScreen()),
    ),
    CustomButton(
      icon: Icons.photo_library,
      color: AppColor.lightGrey,
      action: (ctx) => showGalleryBottomSheet(ctx),
    ),
    CustomButton(
      icon: Icons.video_camera_back_sharp,
      color: AppColor.lightGrey,
    ),
    CustomButton(
      icon: Icons.document_scanner,
      color: AppColor.lightGrey,
    ),
    CustomButton(
      icon: Icons.map,
      color: AppColor.lightGrey,
    ),
  ];
}
