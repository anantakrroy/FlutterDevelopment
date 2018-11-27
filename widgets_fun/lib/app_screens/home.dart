import 'package:flutter/material.dart';

void main() {}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(35.0),
          alignment: Alignment.center,
          color: Colors.deepPurple,
          // width: 200.0,
          // height: 100.0,
          // margin:
          // EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0, bottom: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                    "Flight",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'NotoSansTC',
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0,
                    ),
                  )),
                  Expanded(
                    child: Text(
                    "Trains",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'NotoSansTC',
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0,
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Buses",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'NotoSansTC',
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0,
                    ),
                  )),
                  Expanded(
                      child: Text(
                    "Cabs",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'NotoSansTC',
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0,
                    ),
                  )),
                ],
              ),
              TravelImageAsset(),
              BookButton()
            ],
          )),
    );
  }
}

class TravelImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/travel.jpg');
    Image image = Image(
      image: assetImage,
      width: 350.0,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}

class BookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.indigoAccent,
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Book Ticket',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway-ExtraBoldItalic',
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
