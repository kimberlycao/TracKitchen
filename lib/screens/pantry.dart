import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Components/FoodLists/PantryFoodList.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodItem.dart';
import 'package:kitchenventory/Components/SearchBar.dart';
import 'package:kitchenventory/Models/Food.dart';

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
              Expanded(child: Container(child: PantryFoodList())),
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
