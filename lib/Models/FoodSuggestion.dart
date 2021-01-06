class FoodSuggestion {
  String name;
  String id;
  String imageURL;

  FoodSuggestion(this.name, this.id, this.imageURL);

  ///Parses json and converts it into FoodSuggestion objects
  factory FoodSuggestion.fromJson(Map<String, dynamic> json) {
    return FoodSuggestion(json['name'] as String, json['id'] as String,
        json['imageURL'] as String);
  }
}
