import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentSpending;

  ChartBar(this.label, this.spendingAmount, this.percentSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 3.0,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(width: 0.2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentSpending,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(width: 0.2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(label),
      ],
    );
  }
}
