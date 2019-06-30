import 'package:easylist/pages/auth.dart';
import 'package:easylist/scoped-models/main.dart';
import 'package:flutter/material.dart';

import './pages/home.dart';
import './pages/productmanage.dart';

import './pages/productdetail.dart';

import 'package:easylist/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  // debugPaintLayerBordersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<MainModel>(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.purple,
          primaryColor: Colors.deepOrange,
          fontFamily: 'NotoSerif',
        ),

        // Named routes, routes registry
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => HomePage(),
          '/admin': (BuildContext context) => ProductManage(),
        },

        // Generate custom routes
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == "product") {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  ProductDetail(index),
            );
          }

          return null;
        },

        //default fall back route
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          );
        },
      ),
      model: MainModel(),
    );
  }
}
