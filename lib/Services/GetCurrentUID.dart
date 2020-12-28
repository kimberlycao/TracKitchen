import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Future<String> getCurrentUID() async {
  return _firebaseAuth.currentUser.uid.toString();
}
