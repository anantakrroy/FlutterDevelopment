
import 'package:easylist/pages/product_create.dart';
import 'package:easylist/pages/product_list.dart';

import 'package:flutter/material.dart';

class ProductManage extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;

  ProductManage(this.addProduct, this.deleteProduct);

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
                leading: Icon(Icons.shop),
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
            ProductCreate(addProduct),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
