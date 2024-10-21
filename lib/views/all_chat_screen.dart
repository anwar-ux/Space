import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/views/camo/camara_screen.dart';
import 'package:flutter_application_2/views/chat_screen.dart';
import 'package:flutter_application_2/widgets/floating_action_button.dart';
import 'package:get/get.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 110),
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(const ChatScreen()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.seconderyColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('9:45 AM', style: TextStyle(color: AppColor.white, fontSize: 10)),
                                  const SizedBox(height: 5),
                                  Expanded(
                                    child: Image.asset('assets/5823020.png', fit: BoxFit.contain),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Constants.kHight5,
                    const Text('Name'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ExpandableFab(distance: 80, children: [
        TextButton(onPressed: () {}, child: const Text('New Chat')),
        TextButton(
          onPressed: () {
            Get.to(CameraScreen());
          },
          child: const Text('Create Story'),
        )
      ]),
    );
  }
}
