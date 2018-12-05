import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful App Example",
    home: FavoriteCity(),
  )); 
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameOfCity = "";    //the property which may change
  @override
  Widget build(BuildContext context) {
    debugPrint("Favorite city widget is created");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text("Favorite City"),
      ),
      body: Container(
         margin: EdgeInsets.all(15.0),
         child: Column(
           children: <Widget>[
             TextField(
               onSubmitted: (String userInput) {
                 setState(() {
                  debugPrint("setState is called, this tells the framework to redraw the FavoriteCity widget");
                  nameOfCity = userInput;           
                });
               },
             ),
             Padding(
               padding: EdgeInsets.all(15.0),
               child: Text(
               "Best city is $nameOfCity",
               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              )
            )
          ],
         ),
      ),
    ),
    );
  }

}