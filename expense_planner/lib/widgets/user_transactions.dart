import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _transactionList = [
    Transaction(title: 't1', amount: 23.99, purchaseDate: DateTime.now()),
    Transaction(title: 't2', amount: 12.99, purchaseDate: DateTime.now()),
    Transaction(title: 't3', amount: 13.99, purchaseDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_transactionList),
      ],
    );
  }
}
