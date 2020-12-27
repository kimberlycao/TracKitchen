import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodQuantity.dart';

class NewFoodLocation extends StatefulWidget {
  final Food food;
  NewFoodLocation({this.food}) : super();
  @override
  _NewFoodLocationState createState() => _NewFoodLocationState();
}

class _NewFoodLocationState extends State<NewFoodLocation> {
  String dropdownLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      appBar: AppBar(
          title: Text("Add Food Item",
              style: GoogleFonts.breeSerif(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w100)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Where is it stored?",
              style: TextStyle(fontSize: 25.0, color: Colors.white)),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownButton<String>(
              dropdownColor: Color(0xFF2D3447),
              value: dropdownLocation,
              hint: Text(
                'Select location',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 25,
              elevation: 16,
              style: TextStyle(
                  color: Colors.white, fontSize: 25.0, fontFamily: 'BreeSerif'),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownLocation = newValue;
                  widget.food.location = dropdownLocation;
                });
              },
              items: <String>['Pantry', 'Refrigerator', 'Freezer']
                  .map<DropdownMenuItem<String>>((String location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewFoodQuantity(food: widget.food)));
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Color(0xFF2D3447)),
                )),
          )
        ],
      )),
    );
  }
}
