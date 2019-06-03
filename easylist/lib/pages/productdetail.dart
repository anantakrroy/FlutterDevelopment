import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/painting.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String prodDescription;
  final double prodPrice;

  ProductDetail(
      this.title, this.imageUrl, this.prodPrice, this.prodDescription);

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("This action cannot be undone"),
          actions: <Widget>[
            FlatButton(
              child: Text("Discard"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Contnue"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Back button pressed");
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber[900], Colors.amber[300]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent[100],
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Image.asset(imageUrl),
                  margin: EdgeInsets.only(top: 10.0)),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'NotoSerif',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0,
                                  spreadRadius: 2.0,
                                  offset: Offset.fromDirection(0.0))
                            ],
                            color: Theme.of(context).accentColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '\$' + prodPrice.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Text(prodPrice.toString()),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'FRUIT SPOT, HOGG MARKET',
                        style: TextStyle(fontFamily: 'NotoSerif'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  prodDescription,
                ),
              ),
              RaisedButton(
                child: Text('DELETE'),
                onPressed: () {
                  _showWarningDialog(context);
                },
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
