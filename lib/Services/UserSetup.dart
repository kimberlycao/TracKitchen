import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Creates a new collection for user.
Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
  });
  return;
}
