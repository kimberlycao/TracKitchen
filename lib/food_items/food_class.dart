class FoodItem {
  String foodItem;
  String quantity;
  DateTime purchaseDate;
  String uid;

  FoodItem({this.foodItem, this.quantity, this.purchaseDate, this.uid});
}

class FoodList {
  List<FoodItem> foodList;

  FoodList({this.foodList});
}
