import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  List transactionList = [
    Transaction(title: 't1', amount: 23.99),
    Transaction(title: 't2', amount: 12.99),
    Transaction(title: 't3', amount: 3.99),
  ];

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
            Column(
              children: transactionList.map((transaction) {
                return Card(
                  child: Text(transaction.title),
                );
              }).toList(),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
