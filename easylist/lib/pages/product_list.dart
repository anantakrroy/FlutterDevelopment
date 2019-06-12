import 'package:easylist/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/products/$index');
            },
            child: ListTile(
              leading: Image.asset(products[index]['image']),
              title: Text(products[index]['title']),
              trailing: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ProductEdit(product: products[index]);
                                }),
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
