import 'package:flutter/material.dart';
import 'dart:async';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductDetail(this.title, this.imageUrl);

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
        Navigator.pop(context,false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image.asset(imageUrl),
                  margin: EdgeInsets.only(top: 5.0)),
              Container(
                child: Text(title),
                padding: EdgeInsets.all(10.0),
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
