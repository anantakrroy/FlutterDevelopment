
import './product_create.dart';
import './product_list.dart';

import 'package:flutter/material.dart';

class ProductManage extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;

  ProductManage(this.addProduct, this.deleteProduct);

  Widget _buildSideDrawer(BuildContext context) {
    return  Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("My Pages"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Product List"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
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
