import 'package:flutter/material.dart';
import 'package:TracKit/Components/FoodCard.dart';
import 'package:TracKit/Services/APIUtils.dart';

class FoodList extends StatelessWidget {
  final String location;

  const FoodList({Key key, this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUserLocationFoodsStream(context, location),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('No food items');
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    FoodCard(food: snapshot.data.documents[index]));
          }),
    );
  }
}
