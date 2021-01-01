import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodQuantityTextField extends StatelessWidget {
  const FoodQuantityTextField({
    Key key,
    @required TextEditingController quantityController,
  })  : _quantityController = quantityController,
        super(key: key);

  final TextEditingController _quantityController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: _quantityController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: "Enter quantity",
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
