import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;

  ProductEdit({this.addProduct, this.updateProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEdit> {
  final Map<String, dynamic> _product = {
    'title': '',
    'price': '',
    'description': '',
    'image': 'assets/buffet.jpg',
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

////////////PRODUCT TITLE FIELD/////////////////////////////
  Widget _buildProducTitleField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters';
          }
        },
        initialValue: widget.product == null ? '' : widget.product['title'],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: "Product", hintText: "Enter product name"),
        onSaved: (String value) {
          _product['title'] = value;
        },
      ),
    );
  }

  //////////PRODUCT PRICE FIELD////////////////////////////
  Widget _buildProductPriceField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty || double.tryParse(value) == null) {
            return 'Price required and should be a number';
          }
        },
        initialValue: widget.product['price'].toString(),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: "Price", hintText: "Enter price"),
        onSaved: (String value) {
          _product['price'] = double.parse(value);
        },
      ),
    );
  }

  //////////PRODUCT DESCRIPTION FIELD///////////////////////////
  Widget _buildProductDescriptionField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description required and 10+ characters';
          }
        },
        initialValue: widget.product['description'],
        maxLines: 3,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: "Description",
            hintText: "Enter product details",
            hintMaxLines: 3),
        onSaved: (String value) {
          _product['description'] = value;
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
          }
          _formKey.currentState.save();
          widget.addProduct(_product);
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
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
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
      ),
    );

    // TODO: implement build
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
