import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  /// Passes the user's credential to Firebase to authenticate with the app
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    userSetup(currentUser.displayName);
    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOut() async {
  await googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();

  print("User Signed Out");
}

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
