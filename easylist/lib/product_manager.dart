import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct) {
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
    void initState() {   
      super.initState();                                //recommended to put on top                 
      print('[PRODUCT MANAGER WIDGET] initState()');
      _products.add(widget.startingProduct);            //No need for set state because initState runs before build
      
    }

  @override
  Widget build(BuildContext context) {
    print('[PRODUCT MANAGER WIDGET] build');
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                print('[PRODUCT MANAGER WIDGET] setState()');
                _products.add('Advanced Food tester');
              });
            },
            child: Text("Add product"),
          ),
        ),

        Products(_products)
      ],
    );
  }
}
