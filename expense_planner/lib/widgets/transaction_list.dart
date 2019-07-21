import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '\$${transactionList[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactionList[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    Text(
                      DateFormat.yMMMd().format(transactionList[index].purchaseDate),
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
