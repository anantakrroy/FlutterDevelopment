import 'package:easylist/pages/ui_elements/title_default.dart';
import 'package:easylist/pages/widgets/address_tag.dart';
import 'package:easylist/pages/widgets/price_tag.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:easylist/scoped-models/main.dart';

import '../models/product.dart';


class ProductDetail extends StatelessWidget {
  final int prodIndex;

  ProductDetail(this.prodIndex);

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

/////////////////   ADDRESS ICON ROW ////////////////////////////////////////////
  Widget _buildAddressIconRow() {
    return Container(
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
            AddressTag("FARMERS MARKET, LAKESIDE"),
          ],
        ),
      ),
    );
  }

//////////////  TITLE PRICE ROW ///////////////////////////////////////
  Widget _buildTitlePriceRow(String title, double prodPrice) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(title),
            SizedBox(
              width: 10.0,
            ),
            PriceTag(prodPrice),

            // Text(prodPrice.toString()),
          ],
        ),
      ),
      padding: EdgeInsets.all(10.0),
    );
  }

/////////////// IMAGE CARD //////////////////////////////////////////

  Widget _buildImage(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent[100],
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Image.asset(imageUrl),
      margin: EdgeInsets.only(top: 10.0),
    );
  }

//////////////// DESCRIPTION BOX ////////////////////////////////////////
  Widget _buildDescriptionBox(String prodDescription) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Text(
        prodDescription,
      ),
    );
  }

//////////////  BUILD   /////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Back button pressed");
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.products[prodIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber[300], Colors.amber[50]],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildImage(product.image),
                  _buildTitlePriceRow(product.title, product.price),
                  _buildAddressIconRow(),
                  _buildDescriptionBox(product.description),
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
          );
        },
      ),
    );
  }
}
