import 'package:easylist/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductList(this.products, this.updateProduct);

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
            child: Dismissible(
              key: Key(products[index]['title']),
              background: Container(child: Icon(Icons.delete, color: Colors.white),color: Colors.red,),
              child: ListTile(
                contentPadding: EdgeInsets.all(2.0),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(
                  products[index]['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '\$' + products[index]['price'].toString(),
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
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
                                return ProductEdit(
                                  product: products[index],
                                  updateProduct: updateProduct,
                                  prodIndex: index,
                                );
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
