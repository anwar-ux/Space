import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/views/call_log.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGrey .withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child:  SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '5 Stories > > >',
                  style: TextStyle(fontSize: 25),
                ),
                Constants.kWidth20,
                const Icon(Icons.search),
                Constants.kWidth5,
                IconButton(icon: const Icon( Icons.call),onPressed: ()=>Get.to(const CallLog()),),
                Constants.kWidth5,
                const Icon(Icons.star),
                Constants.kWidth5,
                const Icon(Icons.notifications),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
