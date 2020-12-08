import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodItem.dart';
import 'package:kitchenventory/Widgets/SearchBar.dart';
import 'package:kitchenventory/widgets/FoodList.dart';
import 'package:kitchenventory/Classes/Food.dart';

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
              style: GoogleFonts.breeSerif(
                  color: Colors.white,
                  fontSize: 30.0,
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
              Expanded(child: Container(child: FoodList())),
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
