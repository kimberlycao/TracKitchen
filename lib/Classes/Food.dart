import 'package:kitchenventory/Widgets/FoodCardDescription.dart';

class Food {
  String name;
  String location;
  int quantity;
  QuantityType quantityType;
  DateTime bestBeforeDate;

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
        'quantityType': quantityType,
        'purchaseDate': bestBeforeDate,
      };
}
