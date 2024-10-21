import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/images.dart';
import 'package:flutter_application_2/widgets/camo/text.dart';

class Scanner_DownPart extends StatefulWidget {
  const Scanner_DownPart({super.key});

  @override
  State<Scanner_DownPart> createState() => _Scanner_DownPartState();
}

class _Scanner_DownPartState extends State<Scanner_DownPart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Container(
              height: height / 10,
              width: width,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            location,
                            height: 35,
                            width: 35,
                          ),
                          text("Place", color: Colors.black, weight: FontWeight.w700, size: 16)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 35,
                            width: 35,
                            translator,
                          ),
                          text("Translator", color: Colors.black, weight: FontWeight.bold, size: 16)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
