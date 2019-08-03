import 'package:flutter/foundation.dart';

class Transaction {
  final String title;
  final double amount;
  final DateTime purchaseDate;
  final String id ;

  Transaction({@required this.title,@required this.amount,@required this.purchaseDate,@required this.id});
}
