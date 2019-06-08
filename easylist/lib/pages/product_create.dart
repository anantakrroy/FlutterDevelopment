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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

////////////PRODUCT TITLE FIELD/////////////////////////////
  Widget _buildProducTitleField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (String value) {
          if(value.trim().length <= 0) {
            return 'Title is required';
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: "Product", hintText: "Enter product name"),
            onSaved: (String value) {
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
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: "Price", hintText: "Enter price"),
        onSaved: (String value) {
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
      child: TextFormField(
        maxLines: 3,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: "Description",
            hintText: "Enter product details",
            hintMaxLines: 3),
        onSaved: (String value) {
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
          if (!_formKey.currentState.validate()) {
            return;
          };
          _formKey.currentState.save();
          final Map<String, dynamic> product = {
            'title': titleText,
            'description': productDescription,
            'price': productPrice,
            'image': 'assets/buffet.jpg',
          };
          widget.addProduct(product);
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 450.0 ? 650.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    // TODO: implement build
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding),
        children: <Widget>[
          _buildProducTitleField(),
          _buildProductPriceField(),
          _buildProductDescriptionField(),
          _buildProductCreateButton(),
        ],
      ),
    );
  }
}
