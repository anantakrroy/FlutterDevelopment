import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get dailyTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSpent = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].purchaseDate.day == weekDay.day &&
            recentTransactions[i].purchaseDate.month == weekDay.month &&
            recentTransactions[i].purchaseDate.year == weekDay.year) {
          totalSpent += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSpent);

      return {
        'purchaseDay': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSpent,
      };
    });
  }

  double get weeklySpending {
    return dailyTransactionValue.fold(0.0, (sum, mapItem) {
      return sum + mapItem['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(dailyTransactionValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dailyTransactionValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['purchaseDay'],
                data['amount'],
                weeklySpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / weeklySpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
