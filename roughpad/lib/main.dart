import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintBaselinesEnabled = true;
  runApp(MaterialApp(
    title: 'Returning Data',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverflowBox(
        minHeight: 25.0,
        maxHeight: 50.0,
        minWidth: 400.0,
        maxWidth: 450.0,
        // constraints: BoxConstraints(maxWidth: 150.0, maxHeight: 150.0),
        child: DecoratedBox(
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
          child: Text(
            'Overflow box ',
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
