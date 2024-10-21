import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/views/call_log/all_call_page.dart';
import 'package:get/get.dart';

class CallLog extends StatelessWidget {
  const CallLog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.seconderyColor, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: AppBar(
                backgroundColor: AppColor.seconderyColor,
                leading: Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColor.seconderyColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true, // Enable filling the background color
                    fillColor: AppColor.white, // Set the background color to white
                    prefixIcon: Icon(Icons.search, color: AppColor.lightGrey), // Icon color
                    contentPadding: const EdgeInsets.all(15), // Padding inside the TextField
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      borderSide: BorderSide(color: AppColor.lightGrey.withOpacity(0.5)), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners when focused
                      borderSide: BorderSide(color: AppColor.lightGrey), // Border color when focused
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Default rounded corners
                      borderSide: BorderSide(color: AppColor.lightGrey.withOpacity(0.5)), // Default border
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.edit_square,
                        color: AppColor.seconderyColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left:5,right: 5),
                        indicatorPadding: const EdgeInsets.all(1.5),
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        tabs: [
                          _buildTabIconWithBorder('All'),
                          _buildTabIconWithBorder('Missed'),
                          _buildTabIconWithBorder('Incoming'),
                          _buildTabIconWithBorder('Outgoing'),
                          _buildTabIconWithBorder('Link')
                        ],
                        dividerColor: Colors.transparent,
                      ),
                    ),
                    const Expanded(
                      child:  TabBarView(
                        children: [
                          AllCallPage(),
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
    );
  }

  Widget _buildTabIconWithBorder(String text) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.lightGrey.withOpacity(0.5)),
      ),
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
