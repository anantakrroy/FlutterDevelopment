import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText = '';
    if (resultScore < 10) {
      resultText = 'You are bad!';
    } else if (resultScore < 20) {
      resultText = 'You are a bit likeable!';
    } else if (resultScore < 28) {
      resultText = 'You are great!';
    } else {
      resultText = 'You are amazing!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              'Retake',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
