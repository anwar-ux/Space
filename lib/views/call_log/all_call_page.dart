import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/widgets/camo/text.dart';

class AllCallPage extends StatelessWidget {
  const AllCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.seconderyColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset('assets/5823020.png'),
                  ),
                ),
                Constants.kWidth10,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   
                    Text('Hey , how are you')
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Icon(Icons.message),
                  Constants.kWidth10,
                  Icon(Icons.handshake),
                  Constants.kWidth20
                ],)
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 2,
        ),
      ),
    );
  }
}
