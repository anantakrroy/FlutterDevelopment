import 'package:easylist/pages/home.dart';
import 'package:easylist/pages/product_create.dart';
import 'package:easylist/pages/product_list.dart';
import 'package:easylist/pages/productdetail.dart';
import 'package:easylist/products.dart';
import 'package:flutter/material.dart';

class ProductManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("My Pages"),
              ),
              ListTile(
                title: Text("Product List"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Product Admin"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'My Products',
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreate(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
