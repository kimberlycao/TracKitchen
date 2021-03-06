import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:TracKit/Screens/Freezer.dart';
import 'package:TracKit/Screens/Pantry.dart';
import 'package:TracKit/Screens/Refrigerator.dart';
import 'package:TracKit/Screens/UserProfile.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _page = 0;

  final pageList = [
    PantryScreen(),
    RefrigeratorScreen(),
    FreezerScreen(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xFF2D3447),
          buttonBackgroundColor: Color(0xFFFFFFFF),
          height: 50,
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.ease,
          index: 0,
          items: [
            Icon(Icons.shopping_basket, size: 30.0),
            Icon(Icons.kitchen, size: 30.0),
            Icon(Icons.ac_unit, size: 30.0),
            Icon(Icons.person, size: 30.0)
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ));
  }
}
