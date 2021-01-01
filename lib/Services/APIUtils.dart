import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
