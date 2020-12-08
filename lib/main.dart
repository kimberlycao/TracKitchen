import 'package:flutter/material.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodItem.dart';
import 'package:kitchenventory/screens/Freezer.dart';
import 'package:kitchenventory/screens/Location.dart';
import 'package:kitchenventory/screens/Pantry.dart';
import 'package:kitchenventory/screens/Refrigerator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kitchenventory/Classes/Food.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;

  final pageList = [
    PantryScreen(),
    RefrigeratorScreen(),
    FreezerScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitchenventory',
      theme: ThemeData(fontFamily: 'BreeSerif'),
      home: Scaffold(
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
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          )),
    );
  }
}
