import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'emailId': null,
    'password': null,
    'acceptTerms': false
  };

  String _errorMessage = '';
  Color _borderColor = Colors.blue[300];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  ///////////////////// BACKGROUND IMAGE ////////////////////////////////////////

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage("assets/background.jpeg"),
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
    );
  }

  //////////////////////  EMAIL FIELD ////////////////////////////////////////////

  TextFormField _buildEmailField() {
    return TextFormField(
      focusNode: _emailNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.purple[50],
        labelText: "Email",
        // errorText: _errorMessage,
        errorStyle: TextStyle(backgroundColor: Colors.red[900],color: Colors.white),
        hintText: "Enter Email Id",
        border: OutlineInputBorder(),
      ),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter valid non empty email';
        }
      },
      onSaved: (String value) {
        _formData['emailId'] = value;
      },
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_passwordNode);
      },
    );
  }

//////////////////////// PASSWORD FIELD ///////////////////////////////////////

  TextFormField _buildPasswordField() {
    return TextFormField(
      focusNode: _passwordNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.purple[50],
        labelText: "Password",
        hintText: "Enter Password",
        errorStyle: TextStyle(backgroundColor: Colors.red[900],color: Colors.white),
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      onSaved: (String value) {
        _formData['password'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Enter a non empty password with 6+ characters';
        }
      },
    );
  }

  //////////////////////////   SWITCH TILE //////////////////////////////////////

  SwitchListTile _buildSwitch() {
    return SwitchListTile(
      activeColor: Colors.purple,
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  ////////////////////// SUBMIT FORM //////////////////////////////////////////
  void _submitForm(Function login) {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    login();
    _formKey.currentState.save();
    
    Navigator.pushReplacementNamed(context, '/home');
  }

  //////////////////////// BUILD //////////////////////////////////////////////

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
                child: Form(
                  key: _formKey,
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
                        child: ScopedModelDescendant(builder: (BuildContext context, Widget child, MainModel model) {
                          return RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => _submitForm(model.login),
                        );
                        },),
                      ),
                    ],
                  ),
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
