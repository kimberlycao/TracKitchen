import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kitchenventory/Services/UserSetup.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Validates email and password
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Tracks changes in textfield
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _register();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        userSetup(user.displayName);
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
