import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum QuantityType { individuals, bags, boxes, bundles, bottles }

class FoodCardDescription extends StatelessWidget {
  final DocumentSnapshot food;
  const FoodCardDescription({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food['name'],
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF2D3447),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('${(food['quantity'])} ${(food['quantityType'])}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF2D3447))),
                Text(
                    '${'Best before:'} ${DateFormat('MM/dd/yyyy').format((food['bestBeforeDate']).toDate()).toString()}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF2D3447))),
                Text('${'Use in:'} ${daysUntilExpiration(food)} ${'days'}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF2D3447))),
              ],
            ))
      ],
    );
  }
}

int daysUntilExpiration(DocumentSnapshot food) {
  return (food['bestBeforeDate'].toDate()).difference(DateTime.now()).inDays +
      1;
}

// ignore: missing_return
String quantityTypeToString(QuantityType quantityType) {
  switch (quantityType) {
    case QuantityType.individuals:
      return "Individuals";
    case QuantityType.bags:
      return "Bags";
    case QuantityType.boxes:
      return "Boxes";
    case QuantityType.bundles:
      return "Bundles";
    case QuantityType.bottles:
      return "Bottles";
  }
}
