import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './widgets/helpers/ensure-visible.dart';
import '../models/product.dart';
import '../scoped-models/main.dart';

class ProductEdit extends StatefulWidget {
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
  Widget _buildProducTitleField(Product product) {
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
            return null;
          },
          initialValue: product == null ? '' : product.title,
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
  Widget _buildProductPriceField(Product product) {
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
            return null;
          },
          initialValue: product == null ? '' : product.price.toString(),
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
  Widget _buildProductDescriptionField(Product product) {
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
            return null;
          },
          initialValue: product == null ? '' : product.description,
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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Center(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('SAVE'),
            onPressed: () => _submitForm(model.addProduct, model.updateProduct,
                model.selectedProductIndex),
          ),
        );
      },
    );
  }

  /////////////////////////// SUBMIT FORM //////////////////////////////////////////////
  void _submitForm(Function addProduct, Function updateProduct,
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    selectedProductIndex == null
        ? addProduct(
            Product(
              title: _product['title'],
              description: _product['description'],
              price: _product['price'],
              image: _product['image'],
              emailID: _product[]
            ),
          )
        : updateProduct(
            Product(
              title: _product['title'],
              description: _product['description'],
              price: _product['price'],
              image: _product['image'],
            ),
          );

    Navigator.pushReplacementNamed(context, '/home');
  }

  /////////////////////////// PAGE CONTENT /////////////////////////////////////////////
  Widget _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 450.0 ? 650.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding),
          children: <Widget>[
            _buildProducTitleField(product),
            _buildProductPriceField(product),
            _buildProductDescriptionField(product),
            _buildProductCreateButton(),
          ],
        ),
      ),
    );
  }

  ///////////////////////////   BUILD   ////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =_buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
