import 'package:TracKit/Models/FoodSuggestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Credentials.dart';
import 'FirebaseUtils.dart';

const PANTRY_LOCATION_ID = 'Pantry';
const REFRIGERATOR_LOCATION_ID = 'Refrigerator';
const FREEZER_LOCATION_ID = 'Freezer';

Stream<QuerySnapshot> getUserLocationFoodsStream(
    BuildContext context, location) async* {
  final uid = await getCurrentUID();
  yield* FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Food')
      .where("location", isEqualTo: location)
      .snapshots();
}

void getFoodAutocomplete(String query) async {
  String baseURL = 'https://api.spoonacular.com/food/ingredients/autocomplete';
  try {
    Response response = await Dio().get(baseURL, queryParameters: {
      'query': query,
      'metaInformation': true,
      'apiKey': API_KEY
    });
    final List<FoodSuggestion> foodSuggestionsList = (response.data as List)
        .map((item) => FoodSuggestion.fromJson(item))
        .toList();
  } catch (e) {
    return null;
  }
}
