import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:term_glyph/term_glyph.dart';

void main() => runApp(BhimApp());

class BhimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BHIM - Payments App",
      home: Container(
        child: mainScreen(),
      ),
    );
  }
}

Widget mainScreen() {
  return SafeArea(
    child: Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 3.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'images/logo.png',
                    scale: 1.5,
                    alignment: Alignment.center,
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                ),
                flex: 3,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'images/reward.png',
                    scale: 1.5,
                    alignment: Alignment.center,
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'images/bell.png',
                    scale: 1.5,
                    alignment: Alignment.center,
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(top: 8.0),
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert),
                ),
                flex: 1,
              ),
            ],
          ),
          Divider(
            height: 32.0,
          ),
          Row(
            children: <Widget>[
              Text("TRANSFER MONEY"),
              Flex(
                direction: Axis.vertical,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text("UPI MANDATE"),
              Flex(
                direction: Axis.vertical,
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
          )
        ],
      ),
    ),
  );
}
