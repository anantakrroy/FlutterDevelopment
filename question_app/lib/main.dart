import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  final List<Map> questions = [
    {
      'questionText': 'What is your favorite color ?',
      'answerOption': ['Teal', 'Orange', 'Blue', 'Purple']
    },
    {
      'questionText': 'What is your favorite fruit ?',
      'answerOption': ['Banana', 'Apple', 'Mango', 'Kiwi']
    },
    {
      'questionText': 'What is your favorite animal ?',
      'answerOption': ['Cat', 'Dog', 'Horse', 'Dolphin']
    },
  ];

  void questionAnswered() {
    setState(() {
      _questionIndex += 1;
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
            Questions(questions[_questionIndex]['questionText']),
            ...questions[_questionIndex]['answerOption'].map((answer) {
              return RaisedButton(child: Text(answer),onPressed: questionAnswered,);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
