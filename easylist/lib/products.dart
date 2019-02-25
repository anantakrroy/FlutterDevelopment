import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  List<String> products;

  Products(this.products) {                 //constructor to initialise
    print('[PRODUCTS WIDGET] constructor');
  } 

  @override
  Widget build(BuildContext context) {
    print('[PRODUCTS WIDGET] build');
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/buffet.jpg"),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
