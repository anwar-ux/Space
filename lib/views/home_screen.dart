import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/views/all_chat_screen.dart';
import 'package:flutter_application_2/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/widgets/floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showHorizontalList = false;
  double _dragOffset = 0.0;
  final double _dragThreshold = 100.0; // Minimum drag distance to trigger hiding app bar

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta.dy;
    });

    if (_dragOffset > _dragThreshold) {
      setState(() {
        _showHorizontalList = true;
      });
      _resetDrag();

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _showHorizontalList = false;
        });
      });
    }
  }

  void _resetDrag() {
    setState(() {
      _dragOffset = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: (_) => _resetDrag(),
          child: Stack(
            children: [
              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _showHorizontalList ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: const PreferredSize(
                      preferredSize: Size.fromHeight(100),
                      child: AppBarWidget(),
                    ),
                  ),
                  
                  // Main body content (TabBar & TabBarView)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: const EdgeInsets.all(1.5),
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      tabs: [
                        _buildTabIconWithBorder(Icons.message),
                        _buildTabIconWithBorder(Icons.call),
                        _buildTabIconWithBorder(Icons.star),
                        _buildTabIconWithBorder(Icons.notifications),
                        _buildTabIconWithBorder(Icons.message),
                        _buildTabIconWithBorder(Icons.person),
                      ],
                      dividerColor: Colors.transparent,
                    ),
                  ),
                   Expanded(
                    child: GestureDetector(
                       onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: (_) => _resetDrag(),
                      child: TabBarView(
                        children: [
                          AllChatScreen(),
                          Center(child: Text('Call Screen Content')),
                          Center(child: Text('Star Screen Content')),
                          Center(child: Text('Notification Screen Content')),
                          Center(child: Text('Message Screen Content')),
                          Center(child: Text('Profile Screen Content')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Horizontal ListView coming from the top
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: _showHorizontalList ? 0 : -250, // Slide from top
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  color: AppColor.seconderyColor,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.shade900),
                          ),
                          child: Center(
                            child: Text(
                              'Item ${index + 1}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ExpandableFab(distance: 80, children: [
          TextButton(onPressed: () {}, child: const Text('New Chat')),
          TextButton(
            onPressed: () {},
            child: const Text('Create Story'),
          )
        ]),
      ),
    );
  }

  Widget _buildTabIconWithBorder(IconData icon) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.lightGrey.withOpacity(0.5)),
      ),
      child: Icon(icon),
    );
  }
}
