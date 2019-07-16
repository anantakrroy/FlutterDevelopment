import 'package:flutter/material.dart';

import './quiz.dart';

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
      'answerOption': [
        {'option': 'Teal', 'score': 5},
        {'option': 'Orange', 'score': 10},
        {'option': 'Blue', 'score': 15},
        {'option': 'Purple', 'score': 20}
      ]
    },
    {
      'questionText': 'What is your favorite fruit ?',
      'answerOption': [
        {'option': 'Banana', 'score': 5},
        {'option': 'Apple', 'score': 10},
        {'option': 'Mango', 'score': 15},
        {'option': 'Kiwi', 'score': 20}
      ]
    },
    {
      'questionText': 'What is your favorite animal ?',
      'answerOption': [
        {'option': 'Cat', 'score': 5},
        {'option': 'Dog', 'score': 10},
        {'option': 'Horse', 'score': 15},
        {'option': 'Dolphin', 'score': 20}
      ]
    },
  ];

  int _totalScore = 0;

  void questionAnswered(int score) {
    _totalScore += score;
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
        body: _questionIndex < questions.length
            ? Quiz(questions,_questionIndex,questionAnswered)
            : Center(
                child: Text(
                'Yay! you have scored $_totalScore points!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
      ),
    );
  }
}
