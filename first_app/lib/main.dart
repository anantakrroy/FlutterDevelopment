import 'package:flutter/material.dart';
import 'package:first_app/app_screens/first_screen.dart';

void main() => runApp(FirstApp());  //function expression instead of the usual curly braces

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First Flutter Application",
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Flutter Application"),
        ),
        body: FirstScreen(),
      )
    );
  }
}
