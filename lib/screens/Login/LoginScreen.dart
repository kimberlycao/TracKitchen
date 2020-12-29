import 'package:flutter/material.dart';
import 'package:kitchenventory/Components/EmailLoginForm.dart';
import 'package:kitchenventory/Home/AppHome.dart';
import 'package:kitchenventory/Screens/Login/SignUpForm.dart';
import 'package:kitchenventory/Services/GoogleAuth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image(image: AssetImage('assets/images/Logo.png')),
              ),
              EmailLoginForm(),
              RaisedButton(
                  onPressed: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return AppHome();
                        }));
                      }
                    });
                  },
                  child: Text('Sign in with Google')),
              RaisedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUpForm();
                    }));
                  },
                  child: Text('Sign up with Email')),
            ],
          ),
        ),
      ),
    );
  }
}
