import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchenventory/Home/AppHome.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:intl/intl.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchenventory/Services/GetCurrentUID.dart';

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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
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
          child: Icon(Icons.save, color: Color(0xFF2D3447), size: 30.0),
          backgroundColor: Colors.white,
          onPressed: () async {
            final uid = await getCurrentUID();
            if (food.location == 'Pantry') {
              await db
                  .collection('Users')
                  .doc(uid)
                  .collection('Pantry Foods')
                  .add(food.toJson());
            } else if (food.location == 'Refrigerator') {
              await db
                  .collection('Users')
                  .doc(uid)
                  .collection('Refrigerator Foods')
                  .add(food.toJson());
            } else if (food.location == 'Freezer') {
              await db
                  .collection('Users')
                  .doc(uid)
                  .collection('Freezer Foods')
                  .add(food.toJson());
            }
            Navigator.of(context)
                .pushReplacement((MaterialPageRoute(builder: (context) {
              return AppHome();
            })));
          },
        ));
  }
}
