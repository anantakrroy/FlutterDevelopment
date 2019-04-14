import 'package:flutter/material.dart';
import './textcontrol.dart';

void main() {
  runApp(MagicText());
}

class MagicText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[Main] build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic Text'),
        ),
        body: TextControl('Hello! Get ready to watch the magic'),
      ),
    );
  }
}
