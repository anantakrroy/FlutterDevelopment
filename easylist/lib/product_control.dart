// Passing the data up
// lifitng the state up and using properties/functions of one widget in another widget

import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    print('PRODUCTCONTROL build');
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print('PRODUCTCONTROL onPressed');
        addProduct({"title" : "Buffet : Enjoy the delectable spread!","image" : "assets/buffet.jpg"});
      },
      child: Text("Add product"),
    );
  }
}
