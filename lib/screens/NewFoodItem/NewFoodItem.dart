import 'package:flutter/material.dart';
import 'package:TracKit/Components/FoodNameTextField.dart';
import 'package:TracKit/Models/Food.dart';
import 'package:TracKit/Screens/NewFoodItem/NewFoodLocation.dart';

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
          children: [
            Text("Enter food item:",
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FoodNameTextField(nameController: _nameController),
            ),
            Container(),
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
