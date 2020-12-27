import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Screens/NewFoodItem/NewFoodBestBeforeDate.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';

//For dropdown
const Map<String, QuantityType> quantityTypeList = {
  "Individuals": QuantityType.individuals,
  "Bags": QuantityType.bags,
  "Boxes": QuantityType.boxes,
  "Bundles": QuantityType.bundles,
  "Bottles": QuantityType.bottles
};

class NewFoodQuantity extends StatefulWidget {
  final Food food;
  NewFoodQuantity({this.food}) : super();
  @override
  _NewFoodQuantityState createState() => _NewFoodQuantityState();
}

class _NewFoodQuantityState extends State<NewFoodQuantity> {
  QuantityType dropdownQuantity;
  TextEditingController _quantityController = new TextEditingController();
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
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Quantity:",
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: DropdownButton<QuantityType>(
                value: dropdownQuantity,
                dropdownColor: Color(0xFF2D3447),
                hint: Text(
                  'Select type',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 25,
                elevation: 16,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'BreeSerif'),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (QuantityType newValue) {
                  setState(() {
                    dropdownQuantity = newValue;
                    widget.food.quantityType = newValue;
                  });
                },
                items: quantityTypeList
                    .map((key, value) {
                      return MapEntry(
                          key,
                          DropdownMenuItem<QuantityType>(
                            value: value,
                            child: Text(key),
                          ));
                    })
                    .values
                    .toList(),
              ),
            ),
            RaisedButton(
                onPressed: () {
                  widget.food.quantity = _quantityController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewFoodBestBefore(food: widget.food)));
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
