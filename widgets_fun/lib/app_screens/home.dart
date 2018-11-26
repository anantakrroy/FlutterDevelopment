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
                    ),
                  )),
                ],
              ),
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
                    ),
                  )),
                ],
              ),
              TravelImageAsset()
            ],
          )),
    );
  }
}

class TravelImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/travel.jpg');
    Image image = Image(image: assetImage, width: 250.0,height: 250.0,);
    return Container(child: image,);
  }

}
