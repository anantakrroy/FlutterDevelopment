import 'package:easylist/pages/widgets/products.dart';
import 'package:easylist/scoped-models/products.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text("EasyList"),
        actions: <Widget>[
          ScopedModelDescendant<ProductModel>(
            builder: (BuildContext context, Widget child, ProductModel model) {
              return IconButton(
                tooltip: 'Show favorites',
                icon: Icon(
                  model.displayFavoritesOnly
                      ? Icons.favorite
                      : Icons.favorite_border,
                  semanticLabel: 'Show favorites',
                ),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: Products(),
    );
  }
}
