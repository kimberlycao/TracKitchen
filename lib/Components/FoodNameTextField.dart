import 'package:flutter/material.dart';

class FoodNameTextField extends StatefulWidget {
  const FoodNameTextField({
    Key key,
    @required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  _FoodNameTextFieldState createState() => _FoodNameTextFieldState();
}

class _FoodNameTextFieldState extends State<FoodNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._nameController,
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
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }
}
