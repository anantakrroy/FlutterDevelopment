import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("EasyList"),
        ),
        body: Padding(
          padding: EdgeInsets.only(left:30.0,right: 30.0),
          child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {},
                child: Text("Add product"),
              ),
            ),
            Card(
              child: Column(
              children: <Widget>[
                Image.asset("assets/buffet.jpg"),
                Text("Food Paradise")
              ],
            ),
            )
            
          ],
        ),
        )
      ),
    );
  };
  }
}
