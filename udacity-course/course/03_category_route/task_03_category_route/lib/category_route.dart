// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './category.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {

  CategoryRoute();
 

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  

  @override
  Widget build(BuildContext context) {

    // TODO: Create a list of the eight Categories, using the names and colors
  // from above. Use a placeholder icon, such as `Icons.cake` for each
  // Category. We'll add custom icons later.

  List<dynamic> categoryList = []; 

  for(int i = 0 ; i < _categoryNames.length; i++) {
      categoryList.add([_categoryNames[i], Icons.cake, _baseColors[i]]);
    }
  

  Widget categoryListRender() {
    List list = List();
    for (int i = 0; i < _categoryNames.length; i++) {
      list.add(Category(categoryList[i][0], categoryList[i][1], categoryList[i][2]));
    }
    return Column(children: list,);
  }
    
    // TODO: Create a list view of the Categories
    final listView = ListView(
     children: <Widget>[categoryListRender()],
    );

    // TODO: Create an App Bar
    final appBar = AppBar();

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
