import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodDetails extends StatelessWidget {
  final DocumentSnapshot food;
  FoodDetails({this.food}) : super();

  ///
  TextEditingController _foodNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D3447),
        appBar: AppBar(
            title: Text('Food Details',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w100)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  _foodEditSheet(context);
                },
              )
            ]),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Name: ${food['name']}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text('Stored: ${food['location']}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text('Quantity: ${food['quantity']} ${food['quantityType']}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
            Text(
                '${'Best before:'} ${DateFormat('MM/dd/yyyy').format((food['bestBeforeDate']).toDate()).toString()}',
                style: TextStyle(fontSize: 25.0, color: Colors.white)),
          ]),
        ));
  }

  void _foodEditSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.70,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Edit Food Item',
                            style: TextStyle(
                                color: Color(0xFF2D3447),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w100)),
                        IconButton(
                          icon: Icon(Icons.cancel,
                              color: Color(0xFF2D3447), size: 25),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
