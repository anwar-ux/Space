import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';


class AllCallPage extends StatelessWidget {
  const AllCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.seconderyColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset('assets/5823020.png'),
              ),
            ),
            title: const Text('Name'),
            subtitle: const Text('Hey, whats going'),
            // trailing: const Row(
            //   children: [
            //     Icon(Icons.message),
            //     Constants.kWidth5,
            //     Icon(Icons.handshake)
            //   ],
            // ),
          );
        },
        separatorBuilder: (context, index) => const Divider(), itemCount: 2,
      ),
    );
  }
}
