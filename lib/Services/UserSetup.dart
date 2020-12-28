import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Creates a new collection for user.

Future<void> userSetup(String displayName) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  String email = auth.currentUser.email.toString();
  FirebaseFirestore.instance.collection('Users').doc(uid).set({
    'displayName': displayName,
    'email': email,
    'uid': uid,
  });
  return;
}

Future<void> emailUserSetup(String displayName, String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  FirebaseFirestore.instance.collection('Users').doc(uid).set({
    'displayName': displayName,
    'email': email,
    'uid': uid,
  });
  return;
}
