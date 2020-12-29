import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';

class Food {
  String name;
  String location;
  String quantity;
  QuantityType quantityType;
  DateTime bestBeforeDate;
  String documentID;

  Food(
      {this.name,
      this.location,
      this.quantity,
      this.quantityType,
      this.bestBeforeDate});

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location,
        'quantity': quantity,
        'quantityType': quantityTypeToString(quantityType),
        'bestBeforeDate': bestBeforeDate,
      };

  ///Creating a food object from a Firebase Snapshot
  ///Need a document ID to edit food items once they are created
  Food.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        location = snapshot['location'],
        quantity = snapshot['quantity'],
        quantityType = snapshot['quantityType'],
        bestBeforeDate = snapshot['bestBeforeDate'],
        documentID = snapshot.id;
}
