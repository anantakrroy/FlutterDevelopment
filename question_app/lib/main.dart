import 'package:flutter/material.dart';

import './questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;

  final List<String> questions = [
    'What is your favorite color ?',
    'What is your favorite fruit ?'
  ];

  void questionAnswered() {
    setState(() {
      questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Questions App'),
        ),
        body: Column(
          children: <Widget>[
            //use of custom widget Questions
            Questions(questions[questionIndex]),
           
            RaisedButton(
              child: Text('Orange'),
              onPressed: questionAnswered,
            ),
            RaisedButton(
              child: Text('Purple'),
              onPressed: questionAnswered,
            ),
          ],
        ),
      ),
    );
  }
}
