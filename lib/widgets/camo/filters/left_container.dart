import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/Widgets/button.dart';
import 'package:flutter_application_2/utils/images.dart';
import 'package:get/get.dart';

class LeftContainer extends StatelessWidget {
  const LeftContainer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.15, // Fixed width for the sidebar
      child: Column(
        children: [
          // Back Button at the top
          button(bgcolor: const Color(0xFFEBEBEB), onPressed: () => Get.back(), image: Image.asset(close), color: Colors.white),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                    child: button(bgcolor: Colors.white, icon: Icons.local_fire_department, color: Colors.amber),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
