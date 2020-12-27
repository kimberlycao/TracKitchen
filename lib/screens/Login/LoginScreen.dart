import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:kitchenventory/Home/AppHome.dart';
import 'package:kitchenventory/Services/GoogleAuth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AppHome();
                        }));
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
