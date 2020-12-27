import 'package:flutter/material.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Components/FoodCard.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<Food> foods = [
  Food(
      name: "Broccoli",
      quantity: '2',
      quantityType: QuantityType.individuals,
      bestBeforeDate: DateTime.now()),
  Food(
      name: "Broccoli",
      quantity: '2',
      quantityType: QuantityType.individuals,
      bestBeforeDate: DateTime.now()),
  Food(
      name: "Broccoli",
      quantity: '2',
      quantityType: QuantityType.individuals,
      bestBeforeDate: DateTime.now()),
];

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) =>
              FoodCard(food: foods[index])),
    );
  }
}

class FoodList1 extends StatefulWidget {
  @override
  _FoodList1State createState() => _FoodList1State();
}

class _FoodList1State extends State<FoodList1> {
  @override
  Widget build(BuildContext context) {
    return Container(child: FutureBuilder(builder: (_, snapshot) {
      //Check if there's a connection to Firestore.
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
            child: Text("Loading...", style: TextStyle(color: Colors.white)));
      }
    }));
  }
}
