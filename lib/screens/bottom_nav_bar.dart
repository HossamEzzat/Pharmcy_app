import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../constant/color.dart';
import 'main_screen.dart';
import 'profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  List<Widget> _widgetOption = <Widget> [
    MainScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(

        items: [
          TabItem(
            icon: Icons.home,
          ),
          TabItem(
            icon: Icons.person,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            firstMainColor,
            secondMainColor,
          ],
        ),
        initialActiveIndex: _currentIndex,
        onTap: _changeItem,
      ),
      body: _widgetOption.elementAt(_currentIndex),
    );
  }
  void _changeItem(int value){
    setState(() {
      _currentIndex = value;
    });
  }
}


