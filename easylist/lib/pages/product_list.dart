import 'package:easylist/pages/product_edit.dart';
import 'package:easylist/scoped-models/main.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

class ProductList extends StatelessWidget {
  ////////////////////////  PRODUCT EDIT BUTTON //////////////////////////////////

  Widget _productEditButton(
      BuildContext context, int index, MainModel model) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                model.selectProduct(index);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ProductEdit();
                  }),
                );
              },
              child: Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

//////////////////////// PRODUCT TILE //////////////////////////////////

  Widget _productTile(BuildContext context, int index, MainModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products/$index');
      },
      child: Dismissible(
        key: Key(model.myProducts[index].title),
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.endToStart) {
            model.selectProduct(index);
            model.deleteProduct();
          }
        },
        background: Container(
          child: Icon(Icons.delete, color: Colors.white),
          color: Colors.red,
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(2.0),
              leading: CircleAvatar(
                backgroundImage: AssetImage(model.myProducts[index].image),
              ),
              title: Text(
                model.myProducts[index].title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '\$' + model.myProducts[index].price.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              trailing: _productEditButton(context, index, model),
            ),
            Divider(
              color: Colors.orangeAccent[400],
            ),
          ],
        ),
      ),
    );
  }

////////////////////////// BUILD //////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(3.0),
              child: _productTile(context, index, model),
            );
          },
          itemCount: model.myProducts.length,
        );
      },
    );
  }
}
