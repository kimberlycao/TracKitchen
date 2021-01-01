import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';
import 'package:kitchenventory/Screens/FoodDetails.dart';

class FoodCard extends StatelessWidget {
  final DocumentSnapshot food;
  const FoodCard({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
          color: daysUntilExpiration(food) < 0 ? Colors.red[200] : Colors.white,
          child: InkWell(
            child: Container(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            child: Image(
                                image:
                                    AssetImage('assets/images/groceries.png'),
                                height: 50.0),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: FoodCardDescription(food: food))
                    ],
                  ),
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetails(
                            food: food,
                          )));
            },
          ),
        ));
  }
}
