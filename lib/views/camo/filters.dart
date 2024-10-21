// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/camo/filters/left_container.dart';
import 'package:flutter_application_2/widgets/camo/filters/right_conatiner.dart';

class ArenaXGamesPage extends StatefulWidget {
  const ArenaXGamesPage({super.key});

  @override
  State<ArenaXGamesPage> createState() => _ArenaXGamesPageState();
}

class _ArenaXGamesPageState extends State<ArenaXGamesPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.96,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // Left Filter Sidebar
                  LeftContainer(width: width),

                  // Main Content Area
                  const RightContainer()
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const ArenaXGamesPage();
    },
  );
}
