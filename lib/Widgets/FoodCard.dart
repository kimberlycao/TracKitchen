import 'package:flutter/material.dart';
import 'package:kitchenventory/Classes/Food.dart';

enum QuantityType { individuals, bags, boxes, bundles }

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Card(
      child: Column(children: [
        Text(food.name),
        Text((food.quantity).toString()),
        Text(quantityTypeToString(food.quantityType)),
        Text(food.purchaseDate.toString())
      ]),
    ));
  }
}

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
  }
}
