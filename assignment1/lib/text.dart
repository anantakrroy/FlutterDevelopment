import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {

  String displayText;

  TextOutput(this.displayText);

  @override
  Widget build(BuildContext context) {
    print('[Text Output] build');
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(displayText),
    );
  }
}
