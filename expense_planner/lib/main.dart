import 'package:flutter/material.dart';

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
            Card(
              child: Text('CHART'),
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
