import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Widgets/SearchBar.dart';
import 'package:kitchenventory/widgets/FoodList.dart';

class PantryScreen extends StatefulWidget {
  @override
  _PantryScreenState createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pantry",
                      style: GoogleFonts.breeSerif(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w100)),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SearchBar(),
            SizedBox(height: screenHeight * 0.02),
            Expanded(child: Container(child: FoodList())),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add, color: Color(0xFF2D3447), size: 30),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
