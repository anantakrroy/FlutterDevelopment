import 'package:flutter/material.dart';

class Questions extends StatelessWidget {

  final String questionText;

  Questions(this.questionText); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(questionText),
    );
  }
}