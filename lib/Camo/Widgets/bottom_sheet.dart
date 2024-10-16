
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/Utils/colors.dart';
import 'package:flutter_application_2/Camo/Utils/images.dart';
import 'package:flutter_application_2/Camo/Utils/text.dart';
import 'package:flutter_application_2/Camo/Widgets/button.dart';

showBottom(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(10),
        height: height / 1.1,
        child: Column(
          children: [
            Row(
              children: [
                button(
                  icon: Icons.keyboard_arrow_down_sharp,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: width / 3.7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(gallery),
                    const SizedBox(
                      width: 5,
                    ),
                    text("Dairy", size: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.extent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List<Widget>.generate(50, (index) {
                    return Container(
                      color: Sliver,
                    );
                  })),
            )
          ],
        ),
      );
    },
  );
}
