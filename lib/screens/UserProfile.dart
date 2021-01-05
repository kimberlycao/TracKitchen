import 'package:flutter/material.dart';
import 'package:TracKit/Screens/Login/LoginScreen.dart';
import 'package:TracKit/Services/FirebaseUtils.dart';
import 'package:TracKit/Services/AuthUtils.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      appBar: AppBar(
          centerTitle: true,
          title: Text("Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w100)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              FutureBuilder(
                  future: getCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                NetworkImage('${snapshot.data.photoURL}'),
                            backgroundColor: Colors.transparent,
                          ),
                          Divider(),
                          Text(
                            '${snapshot.data.displayName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '${snapshot.data.email}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      );
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: const Text('Sign Out'),
                  onPressed: () async {
                    signOut();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
