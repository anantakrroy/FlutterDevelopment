import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Expense Planner App',
      home: ExpensePlanner(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class ExpensePlanner extends StatefulWidget {
  @override
  _ExpensePlannerState createState() => _ExpensePlannerState();
}

class _ExpensePlannerState extends State<ExpensePlanner> {
  final List<Transaction> _transactionList = [
    Transaction(title: 't1', amount: 23.99, purchaseDate: DateTime.now()),
    Transaction(title: 't2', amount: 12.99, purchaseDate: DateTime.now()),
    Transaction(title: 't3', amount: 13.99, purchaseDate: DateTime.now()),
  ];

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
    print('Clicked add button!');
  }

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle, amount: txAmount, purchaseDate: DateTime.now());
    setState(() {
      _transactionList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
          actions: <Widget>[
            IconButton(
              onPressed: () => _startAddNewTx(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTx(context),
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.grey,
                child: Text('CHART'),
                elevation: 5.0,
              ),
            ),
            TransactionList(_transactionList),
          ],
        ),
      ),
    );
  }
}
