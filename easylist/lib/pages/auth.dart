import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String emailId = '';
  String password = '';
  bool _acceptTerms = false;

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
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
                      focusNode: _emailNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Email Id",
                          border: OutlineInputBorder()),
                      onChanged: (String value) {
                        emailId = value;
                        isEmail(emailId)
                            ? Text('Valid email')
                            : Text('Invalid email');
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_passwordNode);
                      },
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Password",
                      textScaleFactor: 1.25,
                    ),
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.0, right: 3.0),
                  ),
                  Expanded(
                    child: TextField(
                      focusNode: _passwordNode,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      onChanged: (String value) {
                        password = value;
                      },
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Container(
              child: SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: Text('Accept Terms'),
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
                  if (emailId == "" || password == "") {
                    _showAlertDialog(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text('Email or password cannot be empty!'),
          backgroundColor: Colors.purple[50],
          elevation: 2.0,
        );
      });
}
