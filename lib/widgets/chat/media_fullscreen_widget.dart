import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final List<String> imageList;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.imageList,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Hero(
              tag: 'image$index', // Same tag as in the main screen
              child: Image.network(
                imageList[index],
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
