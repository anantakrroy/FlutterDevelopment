import 'package:easylist/pages/ui_elements/title_default.dart';
import 'package:easylist/pages/widgets/address_tag.dart';
import 'package:easylist/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './price_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  Product product;

  int prodIndex = 0;

  ProductCard(this.product, this.prodIndex);

//////////////// BUTTON BAR  //////////////////////////////////////////////////
  ButtonBar _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          splashColor: Colors.blueAccent,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + prodIndex.toString()),
        ),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
          return IconButton(
            icon: Icon(model.products[prodIndex].isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
            splashColor: Colors.redAccent,
            onPressed: () {
              model.selectProduct(prodIndex);
              model.favoriteProduct();
            },
          );
        })
      ],
    );
  }

  /////////////////////// IMAGE CARD /////////////////////////////////////////////
  Widget _buildImageCard() {
    return Container(
      child: Image.asset(product.image),
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
          child: TitleDefault(product.title),
        ),
        SizedBox(
          width: 20.0,
        ),
        PriceTag(product.price),
      ],
    );
  }

  /// USER INFO
  /// Display the user Id and Email of User
  /// 
  
  Widget _buildUserInfo() {
    return Row(children: <Widget>[
      ScopedModelDescendant(builder: (BuildContext context, Widget child, MainModel model) {
        return Expanded(flex: 1,child: Text(model.login(email: product.emailID,).toString()));
      },) ,
      // Expanded(flex: 1,child: Text(),)
    ],);
  }
  

  /////////////// BUILD /////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          _buildUserInfo(),
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
