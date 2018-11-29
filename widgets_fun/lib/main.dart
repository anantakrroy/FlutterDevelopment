import 'package:flutter/material.dart';
// import 'package:widgets_fun/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(
        title:Text("Basic List View Example"),
      ),
      body: getListView(),
    ),
    ));
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful landscapes!"),
        trailing: Icon(Icons.wb_cloudy),
      ),

      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Contact"),
        onTap: () {
          debugPrint("Contact clicked");
        },
      ),

      ListTile(
        leading: Icon(Icons.computer),
        title: Text("Windows"),
      ),

      Text("Welcome to the contacts app!"),

      Container(color: Colors.black,padding: EdgeInsets.all(15.0),)
    ],
  );

  return listView;
}