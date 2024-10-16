import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({
    super.key,
    required bool showHorizontalList,
  }) : _showHorizontalList = showHorizontalList;

  final bool _showHorizontalList;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _showHorizontalList ? 180 : 0, // Adjust height based on visibility
        color: AppColor.seconderyColor,
        child: _showHorizontalList
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8,top: 50,bottom: 28,right: 8),
                    child: Container(
                      height: 80,
                      width: 80,
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
                                border: Border.all(color:const Color.fromARGB(255, 133, 196, 247),width: 2)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'assets/5823020.png',
                                      fit: BoxFit.contain, // Ensures the image fits within its container
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Constants.kHight5,
                           Text('Name',style: TextStyle(color: AppColor.white,fontSize:12),),
                        ],
                      ),
                    ),
                  );
                },
              )
            : null, // Show nothing if not visible
      );
  }
}
