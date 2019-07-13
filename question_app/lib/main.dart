import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var questionIndex = 0;
  var questions = [
    'What is your favorite color ?',
    'What is your favorite fruit ?'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Questions App'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Teal'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Orange'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Purple'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
