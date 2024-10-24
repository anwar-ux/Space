import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/widgets/chat/media_fullscreen_widget.dart';

class ImageRotate extends StatelessWidget {
  const ImageRotate({
    super.key,
    required this.imagelist,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imagelist),
                fit: BoxFit.cover,
              ))),
    );
  }
}

final List<String> imagelist = [
  "https://media.themoviedb.org/t/p/w220_and_h330_face/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
  "https://media.themoviedb.org/t/p/w220_and_h330_face/pFqzXacKsi9or1GVdxTLutXD9zM.jpg",
  "https://media.themoviedb.org/t/p/w220_and_h330_face/CBRqel4Yzm8BS4fTMScYA1fQLD.jpg",
];

class MediaWidget extends StatelessWidget {
  final bool isMe;
  final int widgetIndex; // Add an index for uniqueness

  const MediaWidget({super.key, required this.isMe, required this.widgetIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text('${imagelist.length} images'),
            Constants.kHight5,
            GestureDetector(
              onTap: () {
                // On tap, navigate to the full-screen viewer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImageViewer(
                      imageList: imagelist,
                      initialIndex: 0, // Start from the first image
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Hero(
                        tag: 'image0-$widgetIndex', // Unique tag with widgetIndex
                        child: ImageRotate(
                          imagelist: imagelist[0],
                          angle: isMe ? -6 : 6,
                          margin: isMe ? const EdgeInsets.only(right: 42) : const EdgeInsets.only(left: 42),
                          size: Size(size.width * 0.28, size.width * 0.42),
                        ),
                      ),
                      Hero(
                        tag: 'image1-$widgetIndex', // Unique tag with widgetIndex
                        child: ImageRotate(
                          imagelist: imagelist[1],
                          angle: isMe ? -2 : 2,
                          margin: isMe ? const EdgeInsets.only(right: 30) : const EdgeInsets.only(left: 30),
                          size: Size(size.width * 0.30, size.width * 0.44),
                        ),
                      ),
                      Hero(
                        tag: 'image2-$widgetIndex', // Unique tag with widgetIndex
                        child: ImageRotate(
                          imagelist: imagelist[2],
                          margin: const EdgeInsets.all(0),
                          size: Size(size.width * 0.36, size.width * 0.48),
                        ),
                      ),
                    ],
                  ),
                  isMe
                      ? const SizedBox.shrink() // If isMe is true, don't show the button
                      : Constants.kWidth20,
                  isMe
                      ? const SizedBox.shrink() // If isMe is true, don't show the button
                      : Icon(Icons.file_download_outlined, color: AppColor.lightGrey, size: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
