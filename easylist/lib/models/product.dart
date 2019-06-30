import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String emailID;
  final String userID;
  final double price;
  final String image;
  final bool isFavorite;

  Product(
      {@required this.title,
      @required this.description,
      @required this.emailID,
      @required this.userID,
      @required this.price,
      @required this.image,
      this.isFavorite = false});
}
