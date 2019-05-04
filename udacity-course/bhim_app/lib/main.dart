import 'package:flutter/material.dart';

void main() => runApp(BhimApp());

class BhimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open Sans'),
      title: "BHIM - Payments App",
      home: Container(
        child: mainScreen(),
      ),
    );
  }
}

Widget mainScreen() {
  return SafeArea(
      child: ListView(
    children: <Widget>[
      Container(
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
              color: Colors.black,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0),
              alignment: Alignment.topLeft,
              child: Text(
                "TRANSFER MONEY",
                textScaleFactor: 0.5,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Heebo-Bold'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Row(
                children: <Widget>[
                  Spacer(flex: 1),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/send.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Send",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/receive.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Request",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/scan.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Scan",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0),
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    "UPI MANDATE",
                    textScaleFactor: 0.5,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Heebo-Bold'),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                      ),
                      Image.asset(
                        'images/newIcon.png',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Row(
                children: <Widget>[
                  Spacer(flex: 1),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/mandate.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "My Mandate",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/create.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/scan2.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Scan",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'images/gift2.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Gift",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0),
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    "MY INFORMATION",
                    textScaleFactor: 0.5,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Heebo-Bold'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.swap_vert,
                        color: Colors.black54,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20.0,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.black,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.perm_identity,
                        color: Colors.black54,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20.0,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.black,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.swap_vert,
                        color: Colors.black54,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          'Bank Account',
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20.0,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.black,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 40.0, left: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        Icons.contacts,
                        color: Colors.black54,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          'My Benficiaries',
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20.0,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ));
}
