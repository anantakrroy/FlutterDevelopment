import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  // named argument - OPTIONAL
  ProductManager({this.startingProduct}) {
    print('[PRODUCT MANAGER WIDGET] constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[PRODUCT MANAGER WIDGET] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  //No need for set state because initState runs before build
  void initState() {
    super.initState(); //recommended to put on top
    print('[PRODUCT MANAGER WIDGET] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
  }

  void _addProduct(String product) {
    print('PRODUCT MANAGER _addproduct');
    setState(() {
      print('[PRODUCT MANAGER WIDGET] setState()');
      _products.add(product);
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[PRODUCT MANAGER WIDGET] build');
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Expanded(child: Products(_products))
      ],
    );
  }
}
