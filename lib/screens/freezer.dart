import 'package:flutter/material.dart';
import 'package:TracKit/Components/FoodList.dart';
import 'package:TracKit/Components/SearchBar.dart';
import 'package:TracKit/Services/APIUtils.dart';

class FreezerScreen extends StatefulWidget {
  @override
  _FreezerScreenState createState() => _FreezerScreenState();
}

class _FreezerScreenState extends State<FreezerScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      appBar: AppBar(
          title: Text("Freezer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w100)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            SearchBar(),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
                child:
                    Container(child: FoodList(location: FREEZER_LOCATION_ID))),
          ],
        ),
      ),
    );
  }
}
