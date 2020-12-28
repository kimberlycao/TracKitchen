import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';
import 'package:kitchenventory/Screens/FoodDetails.dart';
import 'package:kitchenventory/screens/Location.dart';

class FoodCard extends StatelessWidget {
  final DocumentSnapshot food;
  const FoodCard({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
          child: InkWell(
            child: Container(
                height: screenHeight * 0.1,
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
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: FoodCardDescription(food: food)))
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
