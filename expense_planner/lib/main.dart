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
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                ),
              ),
        ),
      ),
    );
  }
}

class ExpensePlanner extends StatefulWidget {
  @override
  _ExpensePlannerState createState() => _ExpensePlannerState();
}

class _ExpensePlannerState extends State<ExpensePlanner> {
  final List<Transaction> _transactionList = [
    Transaction(title: 'T1', amount: 23.99, purchaseDate: DateTime.now()),
    Transaction(title: 'T2', amount: 12.99, purchaseDate: DateTime.now()),
    Transaction(title: 'T3', amount: 13.99, purchaseDate: DateTime.now()),
  ];

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTx(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTx(context),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
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
    );
  }
}
