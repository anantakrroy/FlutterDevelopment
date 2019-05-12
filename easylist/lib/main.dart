import 'package:easylist/pages/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/home.dart';

void main() {
  // debugPaintLayerBordersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.deepOrange,
        fontFamily: 'NotoSerif',
      ),
      home: AuthPage(),
    );
  }
}
