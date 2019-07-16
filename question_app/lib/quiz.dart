import 'package:flutter/material.dart';

import './answer.dart';
import './questions.dart';

class Quiz extends StatelessWidget {

  final List<Map> _questionList;
  final int _questionIndex;
  // final Key answerKey;
  final Function _answerOption;

  Quiz(this._questionList, this._questionIndex, this._answerOption);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //use of custom widget Questions
        Questions(_questionList[_questionIndex]['questionText']),
        ..._questionList[_questionIndex]['answerOption'].map((answer) {
          return AnswerOption(() => _answerOption(answer['score']), answer['option']);
        }).toList(),
      ],
    );
  }
}
