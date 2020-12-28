import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodLocation.dart';

class NewFoodName extends StatefulWidget {
  final Food food;
  NewFoodName({this.food}) : super();
  @override
  _NewFoodNameState createState() => _NewFoodNameState();
}

class _NewFoodNameState extends State<NewFoodName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    _nameController.text = widget.food.name;
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      appBar: AppBar(
          title: Text("Add Food Item",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w100)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter food item:",
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Mushrooms, Chicken,...",
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white30,
                          fontSize: 20.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
            RaisedButton(
                onPressed: () {
                  widget.food.name = _nameController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewFoodLocation(food: widget.food)));
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Color(0xFF2D3447)),
                )),
          ],
        ),
      )),
    );
  }
}
