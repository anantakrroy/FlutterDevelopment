import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
          color: Colors.tealAccent,
          child: Center(
              child: Text(
            "Hello World! Your lucky number: ${generateRandomNumber()}",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                fontFamily: "Roboto"),
          )
          ),
        );
  }

  int generateRandomNumber() {
    var number = Random();
    return number.nextInt(100);
  }
}