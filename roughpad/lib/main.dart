import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sliver App Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Sliver App Demo")),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Color List"),
              centerTitle: true,
            ),
             Container(
              color: Colors.deepPurple,
              height: 50.0,
              width: 50.0,
            ),
             Container(
              color: Colors.deepPurple,
              height: 50.0,
              width: 50.0,
            ),
             Container(
              color: Colors.deepPurple,
              height: 50.0,
              width: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
