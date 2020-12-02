import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kitchenventory/widgets/location_card.dart';

class FoodLocation extends StatefulWidget {
  @override
  _FoodLocationState createState() => _FoodLocationState();
}

class _FoodLocationState extends State<FoodLocation> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xFF2D3447),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text("Location",
                      style: GoogleFonts.breeSerif(
                          color: Colors.white, fontSize: 40.0))
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
                child: ListView(
              children: [
                LocationCard("Pantry", Icons.shopping_basket),
                LocationCard("Refrigerator", Icons.kitchen),
                LocationCard("Freezer", Icons.ac_unit),
              ],
            )),
            SizedBox(
              height: 10.0,
            )
          ]),
        ),
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
            Icon(Icons.ac_unit, size: 30.0)
          ],
          onTap: (index) {},
        ));
  }
}
