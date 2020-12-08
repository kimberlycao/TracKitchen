import 'package:flutter/material.dart';
import 'package:kitchenventory/Classes/Food.dart';
import 'package:kitchenventory/Widgets/FoodCard.dart';
import 'package:kitchenventory/Widgets/FoodCardDescription.dart';
import 'dart:math';

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
