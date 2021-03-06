import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {

  final Function answerOption;
  final String answerText;

  AnswerOption(this.answerOption, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[50],
        textColor: Colors.black,
        child: Text(answerText),
        onPressed: answerOption,
      ),
    );
  }
}
