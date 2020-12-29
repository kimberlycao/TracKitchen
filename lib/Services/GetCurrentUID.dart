import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Future getCurrentUser() async {
  return _firebaseAuth.currentUser;
}

Future<String> getCurrentUID() async {
  return _firebaseAuth.currentUser.uid;
}
