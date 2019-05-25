import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductCreate extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Padding(
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
        ),
        Padding(
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
        ),
        Padding(
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
        ),
        Center(
          child: RaisedButton(
            child: Text('Create'),
            onPressed: () {
              
            },
          ),
        )
      ],
    );
  }
}
