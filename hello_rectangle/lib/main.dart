import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello Rectangle',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Hello, rectangle!'),
      ),
      body: HelloRectangle(),
    ),
  ),
  );
}

class HelloRectangle extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(child: Container(
        color: Colors.blue,
        height: 300.0,
        width: 200.0,
        child: Center(
          child: Text(
            'hello!',
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      );
    }
}