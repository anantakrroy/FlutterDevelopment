import 'package:flutter/material.dart';

import './pages/productdetail.dart';

class Products extends StatelessWidget {
  List<Map> products;

  Products([this.products]) {
    //constructor to initialise
    print('[PRODUCTS WIDGET] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(products[index]["image"]),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border.all(width: 4.0),boxShadow: [
            BoxShadow(
              color: Colors.yellow,
              offset: new Offset(5.0, 5.0),
              blurRadius: 0.5,
              spreadRadius: 0.5
            )
          ],),
          ),
          Text(products[index]["title"],style: TextStyle(fontSize: 18.0,fontFamily: 'NotoSerif'),),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  color: Colors.orange,
                  splashColor: Colors.yellow,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductDetail(products[index]["title"],products[index]["image"]),
                      )))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard = Center(
      child: Text("No products found! Add some !"),
    );
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
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
