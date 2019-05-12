import 'package:easylist/pages/home.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
