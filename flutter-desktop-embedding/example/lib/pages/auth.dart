import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:validators/validators.dart';

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
  String _errorMessage = '';
  Color _borderColor = Colors.blue[300];

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage("assets/background.jpeg"),
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
    );
  }

  TextField _buildEmailField() {
    return TextField(
      focusNode: _emailNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.purple[50],
          labelText: "Email",
          errorText: _errorMessage,
          hintText: "Enter Email Id",
          border: OutlineInputBorder()),
      // onChanged: (String value) {
      //   emailId = value;
      //   setState(() {
      //     isEmail(value)
      //         ? _errorMessage = ""
      //         : _errorMessage = "Enter valid email";
      //   });
      // },
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_passwordNode);
      },
    );
  }

  TextField _buildPasswordField() {
    return TextField(
      focusNode: _passwordNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.purple[50],
        labelText: "Password",
        hintText: "Enter Password",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      onChanged: (String value) {
        password = value;
      },
    );
  }

  SwitchListTile _buildSwitch() {
    return SwitchListTile(
      activeColor: Colors.purple,
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 500.0 ? 400.0 : deviceWidth * 0.95;

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
          decoration: BoxDecoration(image: _buildBackgroundImage()),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildEmailField(),
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildPasswordField(),
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _buildSwitch(),
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
                ),
              ),
            ),
          ),
        ),
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

void _showErrorEmail() {
  Container(
    child: Tooltip(
      message: "Enter valid email",
    ),
    height: 5.0,
    width: 20.0,
  );
}
