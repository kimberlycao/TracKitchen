import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Classes/Food.dart';
import 'package:kitchenventory/Screens/Pantry.dart';

DateTime selectedDate = DateTime.now();

class NewFoodBestBefore extends StatefulWidget {
  final Food food;
  NewFoodBestBefore({this.food}) : super();
  @override
  _NewFoodBestBeforeState createState() => _NewFoodBestBeforeState();
}

class _NewFoodBestBeforeState extends State<NewFoodBestBefore> {
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
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Best Before Date:",
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            //Display selected date
            Text(''),
            RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  "Select Date",
                  style: TextStyle(color: Color(0xFF2D3447)),
                )),
          ]),
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PantryScreen()));
            },
            child: Icon(Icons.save, color: Color(0xFF2D3447), size: 30.0),
            backgroundColor: Colors.white));
  }
}

_selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      errorInvalidText: 'Enter date in valid range',
      builder: (context, child) {
        return Theme(child: child, data: ThemeData.dark().copyWith());
      });
  if (picked != null) {
    selectedDate = picked;
  }
}
