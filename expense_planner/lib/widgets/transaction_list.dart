import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      child: transactionList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions found!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    height: 200,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: ListTile(
                   
                    leading: CircleAvatar(
                      radius: 30.0,
                      child:
                          Text('\$${transactionList[index].amount.toString()}'),
                    ),
                    title: Text(
                      transactionList[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactionList[index].purchaseDate)),
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
