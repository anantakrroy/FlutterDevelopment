import 'package:easylist/pages/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/product.dart';

import '../../scoped-models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
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
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
