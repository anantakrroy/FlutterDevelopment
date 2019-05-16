import 'package:easylist/pages/productmanage.dart';
import 'package:flutter/material.dart';

import '../product_manager.dart';
import './productdetail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            ),
          ],
        )),
        appBar: AppBar(
          title: Text("EasyList"),
        ),
        body: ProductManager(
            //startingProduct: {"title": "Sweets", "image": "assets/buffet.jpg"},
            ));
  }
}
