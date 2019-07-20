import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
