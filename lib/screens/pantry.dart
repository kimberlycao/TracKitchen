import 'package:flutter/material.dart';
import 'package:TracKit/Components/FoodList.dart';
import 'package:TracKit/Screens/NewFoodItem/NewFoodItem.dart';
import 'package:TracKit/Components/SearchBar.dart';
import 'package:TracKit/Models/Food.dart';
import 'package:TracKit/Services/APIUtils.dart';

class PantryScreen extends StatefulWidget {
  @override
  _PantryScreenState createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  @override
  Widget build(BuildContext context) {
    final newFood = new Food();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF2D3447),
        appBar: AppBar(
          title: Text("Pantry",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w100)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              SearchBar(),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                  child:
                      Container(child: FoodList(location: PANTRY_LOCATION_ID))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewFoodName(food: newFood)));
            },
            child: Icon(Icons.add, color: Color(0xFF2D3447), size: 30.0),
            backgroundColor: Colors.white));
  }
}
