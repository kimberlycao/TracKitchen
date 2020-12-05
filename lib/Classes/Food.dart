import 'package:kitchenventory/Widgets/FoodCard.dart';

class Food {
  String name;
  int quantity;
  QuantityType quantityType;
  DateTime purchaseDate;

  Food({this.name, this.quantity, this.quantityType, this.purchaseDate});
}
