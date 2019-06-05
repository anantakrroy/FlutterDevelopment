import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  String title;

  TitleDefault(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0, fontFamily: 'NotoSerif', fontWeight: FontWeight.w900),
    );
  }
}
