import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchenventory/Components/FoodNameTextField.dart';
import 'package:kitchenventory/Components/FoodQuantityTextField.dart';
import 'package:kitchenventory/Home/AppHome.dart';
import 'package:kitchenventory/Services/FirebaseUtils.dart';

class FoodDetails extends StatefulWidget {
  final DocumentSnapshot food;
  FoodDetails({this.food}) : super();

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final db = FirebaseFirestore.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  void initState() {
    super.initState();
    _nameController.text = widget.food['name'];
    _quantityController.text = widget.food['quantity'];
  }

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
                icon: Icon(Icons.info, color: Colors.white),
                onPressed: () {},
              )
            ]),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Name:",
                  style: TextStyle(fontSize: 25.0, color: Colors.white)),
              FoodNameTextField(
                nameController: _nameController,
              ),
              Divider(),
              Text(
                'Quantity:',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              FoodQuantityTextField(quantityController: _quantityController),
              Divider(),
              Column(
                children: [
                  RaisedButton(
                    onPressed: () async {
                      final uid = await getCurrentUID();
                      db
                          .collection('Users')
                          .doc(uid)
                          .collection(widget.food['location'])
                          .doc(widget.food.id)
                          .update({'quantity': _quantityController.text});
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return AppHome();
                      }));
                    },
                    child: const Text('Save'),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () async {
                      final uid = await getCurrentUID();
                      db
                          .collection('Users')
                          .doc(uid)
                          .collection(widget.food['location'])
                          .doc(widget.food.id)
                          .delete();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return AppHome();
                      }));
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
