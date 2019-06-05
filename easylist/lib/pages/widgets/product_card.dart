import 'package:easylist/pages/ui_elements/title_default.dart';
import 'package:easylist/pages/widgets/address_tag.dart';
import 'package:flutter/material.dart';
import './price_tag.dart';

class ProductCard extends StatelessWidget {
  Map<String, dynamic> product = {};

  int prodIndex = 0;

  ProductCard(this.product, this.prodIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(product["image"]),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(width: 4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.yellow,
                    offset: new Offset(5.0, 5.0),
                    blurRadius: 0.5,
                    spreadRadius: 0.5)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                child: TitleDefault(product['title']),
              ),
              SizedBox(
                width: 20.0,
              ),
              PriceTag(product['price']),
            ],
          ),
          AddressTag("FARMERS MARKET, LAKESIDE"),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.blue,
                splashColor: Colors.blueAccent,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + prodIndex.toString()),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                splashColor: Colors.redAccent,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
