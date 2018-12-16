import 'package:flutter/material.dart';
import 'package:calculator_si/methods/SIForm.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigo,
      brightness: Brightness.dark,
    ),
  ));
}
