import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/chat/main_chat_screen.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/views/all_chat_screen.dart';
import 'package:flutter_application_2/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/widgets/status_bar_widget.dart';
import 'package:get/get.dart';
import 'package:link_preview_generator/link_preview_generator.dart'; // Import GetX package

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

   HomeScreen({super.key}); 
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) {
              homeController.show(); // Show list when dragging down
            } else {
              homeController.hide(); // Hide list when dragging up
            }
          },
          child: Column(
            children: [
              Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: homeController.showHorizontalList.value ? 180 : 0, // Change height based on visibility
                curve: Curves.easeInOut,
                child: homeController.showHorizontalList.value
                    ? const StatusBarWidget(showHorizontalList: true)
                    : const SizedBox.shrink(), // Placeholder when not visible
              )),
              // AppBar when horizontal list is not shown
              Obx(() => homeController.showHorizontalList.value ? Container() : const AppBarWidget()),

              // Apply border radius to the entire body (TabBar & TabBarView)
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding: EdgeInsets.zero,
                          indicatorPadding: const EdgeInsets.all(1.5),
                          labelColor: Colors.white,
                          indicator: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          tabs: [
                            _buildTabIconWithBorder(Icons.message),
                            _buildTabIconWithBorder(Icons.call),
                            _buildTabIconWithBorder(Icons.star),
                            _buildTabIconWithBorder(Icons.notifications),
                            _buildTabIconWithBorder(Icons.message),
                            _buildTabIconWithBorder(Icons.person),
                          ],
                          dividerColor: Colors.transparent,
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            AllChatScreen(),
                            Center(child: Text('Call Screen Content')),
                            Center(child: Text('Star Screen Content')),
                            Center(child: Text('Notification Screen Content')),
                            Center(child: Text('Message Screen Content')),
                            Center(child: Text('Profile Screen Content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabIconWithBorder(IconData icon) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.lightGrey.withOpacity(0.5)),
      ),
      child: Icon(icon),
    );
  }
}
