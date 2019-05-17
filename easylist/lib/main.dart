import 'package:easylist/pages/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/home.dart';
import './pages/productmanage.dart';
import './pages/auth.dart';
import './pages/productdetail.dart';

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
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    print('PRODUCT MANAGER _addproduct');
    setState(() {
      print('[PRODUCT MANAGER WIDGET] setState()');
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.deepOrange,
        fontFamily: 'NotoSerif',
      ),
      routes: {
        '/': (BuildContext context) =>
            HomePage(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductManage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        final int index = int.parse(pathElements[2]);
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == "product") {
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductDetail(
                _products[index]["title"], _products[index]["image"]),
          );
        }

        return null;
      },
    );
  }
}
