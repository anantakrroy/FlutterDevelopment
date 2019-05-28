
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
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Email",
                      textScaleFactor: 1.25,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Enter Email Id"),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Password",textScaleFactor: 1.25,),
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.0, right: 3.0),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                      ),
                      obscureText: true,
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
