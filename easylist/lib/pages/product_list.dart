import 'package:easylist/pages/product_edit.dart';
import 'package:easylist/scoped-models/products.dart';
import '../models/product.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductList(this.products, this.updateProduct, this.deleteProduct);

  ////////////////////////  PRODUCT EDIT BUTTON //////////////////////////////////

  Widget _productEditButton(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70.0,
        child: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, ProductModel model) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    model.selectedProduct(index);
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
            );
          },
        ),
      ),
    );
  }

//////////////////////// PRODUCT TILE //////////////////////////////////

  Widget _productTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products/$index');
      },
      child: Dismissible(
        key: Key(products[index].title),
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.endToStart) {
            deleteProduct(index);
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
                backgroundImage: AssetImage(products[index].image),
              ),
              title: Text(
                products[index].title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '\$' + products[index].price.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              trailing: _productEditButton(context, index),
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(3.0),
          child: _productTile(context, index),
        );
      },
      itemCount: products.length,
    );
  }
}
