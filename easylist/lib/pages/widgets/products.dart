import 'package:easylist/pages/widgets/price_tag.dart';
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
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset(products[index]["image"]),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                      child: Text(
                        products[index]["title"],
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'NotoSerif',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    PriceTag(products[index]['price']),
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                      child: Text("FARMERS MARKET, LAKESIDE")),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.info),
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () => Navigator.pushNamed<bool>(
                          context, '/product/' + index.toString()),
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
