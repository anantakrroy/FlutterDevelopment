import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  List transactionList = [
    Transaction(title: 't1', amount: 23.99, purchaseDate: DateTime.now()),
    Transaction(title: 't2', amount: 12.99, purchaseDate: DateTime.now()),
    Transaction(title: 't3', amount: 13.99, purchaseDate: DateTime.now()),
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(transaction.amount.toString()),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(transaction.title),
                        Text(transaction.purchaseDate.toString()),
                      ],
                    ),
                  ],
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
