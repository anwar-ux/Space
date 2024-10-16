import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            elevation: 5,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3E50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: AppColor.seconderyColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/5823020.png',
                  ),
                ],
              ),
            ),
            actions: [
              Icon(
                Icons.menu,
                color: AppColor.white,
              ),
              Constants.kWidth20,
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  color: AppColor.seconderyColor,
                  child: Row(
                    children: [],
                  ),
                ))
          ],
        ));
  }
}
