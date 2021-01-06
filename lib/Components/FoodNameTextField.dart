import 'package:flutter/material.dart';
import 'package:TracKit/Services/APIUtils.dart';

class FoodNameTextField extends StatefulWidget {
  const FoodNameTextField({
    @required TextEditingController nameController,
  })  : _nameController = nameController,
        super();

  final TextEditingController _nameController;

  @override
  _FoodNameTextFieldState createState() => _FoodNameTextFieldState();
}

class _FoodNameTextFieldState extends State<FoodNameTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
          onChanged: (query) {
            getFoodAutocomplete(query);
          },
        ),
      ],
    );
  }
}
