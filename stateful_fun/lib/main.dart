import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Stateful App Example',
    home: FavoriteCity(),
  )); 
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameOfCity = "";    //the property which may change
  var _currencies = ['Rupee','Dollar','Pound','Others'];
  var _currentItemSelected = 'Rupee';

  @override
  Widget build(BuildContext context) {
    // debugPrint("Favorite city widget is created");
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
               onChanged: (String userInput) {
                 setState(() {
                  // debugPrint("setState is called, this tells the framework to redraw the FavoriteCity widget");
                  nameOfCity = userInput;           
                });
               },
             ),

             DropdownButton<String>(
               items: _currencies.map((String dropDownStringItem) {
                 return DropdownMenuItem<String>(
                   value: dropDownStringItem,
                   child: Text(dropDownStringItem),
                 );
               }).toList(),

               onChanged: (String currencySelected) {
                 setState(() {
                    this._currentItemSelected = currencySelected;
                  });
               },

               value: _currentItemSelected,

               elevation: 2,
                  
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