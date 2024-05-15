import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/home_screen.dart';
import 'package:foodallergendetector/profile.dart';
import 'package:foodallergendetector/saved_prod.dart';
import 'package:foodallergendetector/settings.dart';

class NavigatorPage extends StatefulWidget {
  final int initialIndex;

  NavigatorPage({this.initialIndex = 0});

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  final screens = [HomeScreen(), SavedPage(), ProfilePage(), SettingsPage()];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: screens,
        ),
      ),
      bottomNavigationBar: _currentIndex >= 0 && _currentIndex <= 3
          ? BottomNavyBar(
              selectedIndex: _currentIndex,
              backgroundColor: Color(0xff3a57e8),
              onItemSelected: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  title: Text("Scan"),
                  icon: Icon(Icons.barcode_reader),
                  textAlign: TextAlign.center,
                  activeColor: Colors.white,
                  inactiveColor: Color.fromRGBO(255, 255, 255, 0.466),
                ),
                BottomNavyBarItem(
                  title: Text("Saved"),
                  icon: Icon(Icons.favorite_border),
                  textAlign: TextAlign.center,
                  activeColor: Colors.white,
                  inactiveColor: Color.fromRGBO(255, 255, 255, 0.466),
                ),
                BottomNavyBarItem(
                  title: Text("Profile"),
                  icon: Icon(Icons.person),
                  textAlign: TextAlign.center,
                  activeColor: Colors.white,
                  inactiveColor: Color.fromRGBO(255, 255, 255, 0.466),
                ),
                BottomNavyBarItem(
                  title: Text("Settings"),
                  icon: Icon(Icons.settings),
                  textAlign: TextAlign.center,
                  activeColor: Colors.white,
                  inactiveColor: Color.fromRGBO(255, 255, 255, 0.466),
                ),
              ],
            )
          : null,
    );
  }
}
