// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/Utils/images.dart';
import 'package:flutter_application_2/Camo/Utils/text.dart';
import 'package:flutter_application_2/Camo/Widgets/button.dart';

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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.97,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    // Header Row with title and buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Close Button
                          button(
                            image: Image.asset(
                              close,
                              color: Colors.white,
                            ),
                            bgcolor: const Color(0xFFEBEBEB),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          
                          // Title Container
                          Container(
                            width: width / 1.6,
                            height: width / 9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFEBEBEB),
                            ),
                            child: Center(
                              child: text(
                                'XRpresso',
                                size: 25,
                                weight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          
                          // Placeholder button for future functionality
                          button(
                            bgcolor: const Color(0xFFEBEBEB),
                          ),
                        ],
                      ),
                    ),

                    // Vertical Sidebar with Icons
                    Positioned(
                      top: 70,
                      child: Container(
                        width: width / 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 4),
                            button(bgcolor: Colors.white),
                            button(bgcolor: Colors.white),
                            button(bgcolor: Colors.white),
                            button(bgcolor: Colors.white),
                            const SizedBox(height: 3),
                          ],
                        ),
                      ),
                    ),

                    // Main Grid for Displaying Content
                    Positioned(
                      top: 30,
                      right: 0,
                      child: SizedBox(
                        height: height,
                        width: width / 1.25,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        text(
                                          "Rangoli Painting",
                                          color: Colors.black,
                                          size: 12,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
