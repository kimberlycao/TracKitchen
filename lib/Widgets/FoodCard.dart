import 'package:flutter/material.dart';
import 'package:kitchenventory/Classes/Food.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Card(
      child: Column(
        children: [Text(food.name)],
      ),
    ));
  }
}
