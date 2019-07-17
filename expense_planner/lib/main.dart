import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.grey,
                child: Text('CHART'),
                elevation: 5.0,
              ),
            ),
            Card(
              child: Text('List of transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
