import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductDetail(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Container(child: Image.asset(imageUrl),margin: EdgeInsets.only(top: 5.0)),
             Container(child: Text('This is the product details page',),padding: EdgeInsets.all(10.0),),
             RaisedButton(child: Text('BACK'),onPressed: () => Navigator.pop(context),color: Colors.orange,)
          ],
        ),
      ),
    );
  }
}
