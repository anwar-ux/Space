import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 110),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.seconderyColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                            children: [
                              Text(
                                '9:45 AM',
                                style: TextStyle(color: AppColor.white,fontSize: 10),
                              ),
                              const SizedBox(height: 5), // Space between Text and Image
                              Expanded(
                                // This will make the image take up the remaining space
                                child: Image.asset(
                                  'assets/5823020.png',
                                  fit: BoxFit.contain, // Ensures the image fits within its container
                                ),
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
          );
        },
      ),
    );
  }
}