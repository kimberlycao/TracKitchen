import 'package:flutter/material.dart';
import 'package:kitchenventory/Classes/Food.dart';
import 'package:kitchenventory/Widgets/FoodCardDescription.dart';
import 'package:kitchenventory/screens/Location.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
          child: Container(
              height: screenHeight * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        child: Image(
                            image: AssetImage('assets/images/groceries.png'),
                            height: 50.0),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: FoodCardDescription(food: food)))
                ],
              )),
        ));
  }
}
