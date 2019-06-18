import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './widgets/helpers/ensure-visible.dart';
import '../models/product.dart';
import '../scoped-models/products.dart';

class ProductEdit extends StatefulWidget {
  final Product product;
  final Function addProduct;
  final Function updateProduct;
  final int prodIndex;

  ProductEdit({this.product, this.addProduct, this.updateProduct, this.prodIndex});

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
  final _titleNode = FocusNode();
  final _priceNode = FocusNode();
  final _descriptionNode = FocusNode();

////////////PRODUCT TITLE FIELD/////////////////////////////
  Widget _buildProducTitleField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EnsureVisibleWhenFocused(
        focusNode: _titleNode,
        child: TextFormField(
          focusNode: _titleNode,
          validator: (String value) {
            if (value.isEmpty || value.length < 5) {
              return 'Title is required and should be 5+ characters';
            }
          },
          initialValue: widget.product == null ? '' : widget.product.title,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              labelText: "Product", hintText: "Enter product name"),
          onSaved: (String value) {
            _product['title'] = value;
          },
        ),
      ),
    );
  }

  //////////PRODUCT PRICE FIELD////////////////////////////
  Widget _buildProductPriceField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EnsureVisibleWhenFocused(
        focusNode: _priceNode,
        child: TextFormField(
          focusNode: _priceNode,
          validator: (String value) {
            if (value.isEmpty || double.tryParse(value) == null) {
              return 'Price required and should be a number';
            }
          },
          initialValue:
              widget.product == null ? '' : widget.product.price.toString(),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: "Price", hintText: "Enter price"),
          onSaved: (String value) {
            _product['price'] = double.parse(value);
          },
        ),
      ),
    );
  }

  //////////PRODUCT DESCRIPTION FIELD///////////////////////////
  Widget _buildProductDescriptionField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EnsureVisibleWhenFocused(
        focusNode: _descriptionNode,
        child: TextFormField(
          focusNode: _descriptionNode,
          validator: (String value) {
            if (value.isEmpty || value.length < 10) {
              return 'Description required and 10+ characters';
            }
          },
          initialValue:
              widget.product == null ? '' : widget.product.description,
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
      ),
    );
  }

  ///////////PRODUCT CREATE/EDIT BUTTON///////////////////////////////
  Widget _buildProductCreateButton() {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return Center(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('SAVE'),
            onPressed: () => _submitForm(model.addProduct, model.updateProduct),
          ),
        );
      },
    );
  }

  /////////////////////////// SUBMIT FORM //////////////////////////////////////////////
  void _submitForm(Function addProduct, Function updateProduct) {
    if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              widget.product == null
                  ? addProduct(
                      Product(
                        title: _product['title'],
                        description: _product['description'],
                        price: _product['price'],
                        image: _product['image'],
                      ),
                    )
                  : updateProduct(
                      Product(
                        title: _product['title'],
                        description: _product['description'],
                        price: _product['price'],
                        image: _product['image'],
                      ),
                      widget.prodIndex);

              Navigator.pushReplacementNamed(context, '/home');
  }

  ///////////////////////////   BUILD   ////////////////////////////////////////////////

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
