import 'package:flutter/material.dart';
import 'package:calculator_si/methods/currency.dart';
import 'package:calculator_si/methods/SIForm.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.indigo,
    ),
    home: SIForm(),
  ));
}
