import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/views/all_chat_screen.dart';
import 'package:flutter_application_2/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/widgets/status_bar_widget.dart';

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

    // Show list when dragging down
    if (_dragOffset > _dragThreshold) {
      setState(() {
        _showHorizontalList = true;
      });
      _resetDrag();
    }

    // Hide list when dragging up
    if (_dragOffset < -_dragThreshold) {
      setState(() {
        _showHorizontalList = false;
      });
      _resetDrag();
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
        backgroundColor:AppColor.white,
        body: GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: (_) => _resetDrag(),
          child: Column(
            children: [
              _showHorizontalList
                  ? StatusBarWidget(showHorizontalList: _showHorizontalList)
                  : const AppBarWidget(),

              // Apply border radius to the entire body (TabBar & TabBarView)
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
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
                          child: const TabBarView(
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
                ),
              ),
            ],
          ),
        ),
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
