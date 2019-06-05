
import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;

  ProductCreate(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  String titleText = '';
  double productPrice = 0.0;
  String productDescription = '';
  String imageUrl = 'assets/buffet.jpg';


////////////PRODUCT TITLE FIELD/////////////////////////////
  Widget _buildProducTitleField() {
    return Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelText: "Product", hintText: "Enter product name"),
            onChanged: (String value) {
              setState(() {
                titleText = value;
              });
            },
          ),
        );
  }

  //////////PRODUCT PRICE FIELD////////////////////////////
  Widget _buildProductPriceField() {
    return Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration:
                InputDecoration(labelText: "Price", hintText: "Enter price"),
            onChanged: (String value) {
              setState(() {
                productPrice = double.parse(value);
              });
            },
          ),
        );
  }

  //////////PRODUCT DESCRIPTION FIELD///////////////////////////
  Widget _buildProductDescriptionField() {
    return Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            maxLines: 3,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelText: "Description",
                hintText: "Enter product details",
                hintMaxLines: 3),
            onChanged: (String value) {
              setState(() {
                productDescription = value;
              });
            },
          ),
        );
  }

  ///////////PRODUCT CREATE BUTTON///////////////////////////////
  Widget _buildProductCreateButton() {
  return Center(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Create'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': titleText,
                'description': productDescription,
                'price': productPrice,
                'image' : 'assets/buffet.jpg',
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context,'/home');
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        _buildProducTitleField(),
        _buildProductPriceField(),
        _buildProductDescriptionField(),
        _buildProductCreateButton(),
      ],
    );
  }
}
