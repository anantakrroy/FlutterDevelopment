import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Color _generateRandomColor() {
    List colors = [Colors.purpleAccent, Colors.orangeAccent, Colors.yellowAccent];
    Random randomColor = Random();
    int index = 0 ;
    index = randomColor.nextInt(3);
    return colors[index];
  }
  
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 4,
          mainAxisSpacing: 0.25,
          crossAxisSpacing: 0.25,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (int index) {
            return ListTile(
              title: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
              isThreeLine: true,
              subtitle: Container(
                color: _generateRandomColor(),
              ),
            );
          }),
        ),
      ),
    );
  }
}
