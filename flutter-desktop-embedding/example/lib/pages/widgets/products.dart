import './product_card.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  List<Map<String, dynamic>> products;

  Products(this.products) {
    //constructor to initialise
    print('[PRODUCTS WIDGET] constructor');
  }

  // Widget _buildProductItem(BuildContext context, int index) {}

  Widget _buildProductList() {
    Widget productCard = Center(
      child: Text("No products found! Add some !"),
    );

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[PRODUCTS WIDGET] build');
    return _buildProductList();
  }
}
