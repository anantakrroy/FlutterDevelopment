import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;

  Result(this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Yay! you have scored $resultScore points!',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
