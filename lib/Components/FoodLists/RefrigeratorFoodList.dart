import 'package:flutter/material.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Components/FoodCard.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchenventory/Services/GetCurrentUID.dart';

class RefrigeratorFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUserRefrigeratorFoodsStream(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('No food items');
            return new ListView.builder(
                shrinkWrap: false,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    FoodCard(food: snapshot.data.documents[index]));
          }),
    );
  }
}

Stream<QuerySnapshot> getUserRefrigeratorFoodsStream(
    BuildContext context) async* {
  final uid = await getCurrentUID();
  yield* FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Refrigerator')
      .snapshots();
}
