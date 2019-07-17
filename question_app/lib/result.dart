import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

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
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
