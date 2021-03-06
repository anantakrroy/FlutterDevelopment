import '../ui_elements/title_default.dart';
import './address_tag.dart';
import 'package:flutter/material.dart';
import './price_tag.dart';

class ProductCard extends StatelessWidget {
  Map<String, dynamic> product = {};

  int prodIndex = 0;

  ProductCard(this.product, this.prodIndex);

//////////////// BUTTON BAR  //////////////////////////////////////////////////
  ButtonBar _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Colors.blue,
          splashColor: Colors.blueAccent,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + prodIndex.toString()),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          splashColor: Colors.redAccent,
          onPressed: () {},
        )
      ],
    );
  }

  /////////////////////// IMAGE CARD /////////////////////////////////////////////
  Widget _buildImageCard() {
    return Container(
      child: Image.asset(product["image"]),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 4.0),
        boxShadow: [
          BoxShadow(
              color: Colors.yellow,
              offset: new Offset(5.0, 5.0),
              blurRadius: 0.5,
              spreadRadius: 0.5)
        ],
      ),
    );
  }

  ////////////////////   TITLE PRICE ROW //////////////////////////////////////////
  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: TitleDefault(product['title']),
        ),
        SizedBox(
          width: 20.0,
        ),
        PriceTag(product['price']),
      ],
    );
  }

  /////////////// BUILD /////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          _buildImageCard(),
          _buildTitlePriceRow(),
          AddressTag("FARMERS MARKET, LAKESIDE"),
          _buildButtonBar(context),
        ],
      ),
    );
    ;
  }
}
