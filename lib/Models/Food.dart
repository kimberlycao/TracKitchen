import 'package:intl/intl.dart';
import 'package:kitchenventory/Components/FoodCardDescription.dart';

class Food {
  String name;
  String location;
  String quantity;
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
        'quantityType': quantityTypeToString(quantityType),
        'bestBeforeDate':
            DateFormat('MM/dd/yyyy').format(bestBeforeDate).toString(),
      };
}
