import 'package:flutter/material.dart';
import 'package:kitchenventory/Classes/Food.dart';
import 'package:kitchenventory/Widgets/FoodCard.dart';

final List<Food> foods = [
  Food(
      name: "Carrots",
      quantity: 3,
      quantityType: QuantityType.individuals,
      purchaseDate: DateTime.now()),
  Food(
      name: "Onions",
      quantity: 2,
      quantityType: QuantityType.individuals,
      purchaseDate: DateTime.now())
];

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListView.builder(
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) =>
                FoodCard(food: foods[index])));
  }
}
