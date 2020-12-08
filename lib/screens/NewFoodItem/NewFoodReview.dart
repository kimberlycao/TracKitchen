import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Classes/Food.dart';
import 'package:intl/intl.dart';
import 'package:kitchenventory/Widgets/FoodCardDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewFoodReview extends StatelessWidget {
  final Food food;
  NewFoodReview({this.food}) : super();
  final db = FirebaseFirestore.instance;
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
            Text('Name: ${food.name}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text('Stored: ${food.location}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text(
                'Quantity: ${food.quantity} ${quantityTypeToString(food.quantityType)}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text(
                '${'Best before:'} ${DateFormat('MM/dd/yyyy').format(food.bestBeforeDate).toString()}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
          ]),
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await db.collection('foods').add(food.toJson());
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Icon(Icons.save, color: Color(0xFF2D3447), size: 30.0),
            backgroundColor: Colors.white));
  }
}
