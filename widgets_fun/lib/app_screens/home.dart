import 'package:flutter/material.dart';

void main() {}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        // width: 200.0,
        // height: 100.0,
        margin: EdgeInsets.only(right:20.0, left: 20.0, top: 30.0),
        child: Text(
          "Flight",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
