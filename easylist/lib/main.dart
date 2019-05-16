import 'package:easylist/pages/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/home.dart';
import './pages/productmanage.dart';
import './pages/auth.dart';

void main() {
  // debugPaintLayerBordersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/' : (BuildContext context) => AuthPage(),
      //   '/admin' : (BuildContext context) => ProductManage(),
      // },
      theme: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.deepOrange,
        fontFamily: 'NotoSerif',
      ),
      home: Scaffold(
        backgroundColor: const Color(0xffF6F8FA),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Tab 1",
                style: TextStyle(fontFamily: "iransans"),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.beach_access),
              title: Text(
                "Tab 2",
                style: TextStyle(fontFamily: "iransans"),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt),
              title: Text(
                "Tab 3",
                style: TextStyle(fontFamily: "iransans"),
              )),
        ]),
        body: Container(
          child: Center(
            child: Text("Hello from tab 1"),
          ),
        ),
      ),
      // home: AuthPage(),
    );
  }
}
