import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {

  final Function answerOption;

  AnswerOption(this.answerOption);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Teal'),
        onPressed: answerOption,
      ),
    );
  }
}
