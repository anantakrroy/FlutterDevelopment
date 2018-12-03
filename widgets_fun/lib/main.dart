import 'package:flutter/material.dart';
// import 'package:widgets_fun/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(
        title:Text("Long List View Example", style: TextStyle(
          fontFamily: 'Monoton',
          fontSize: 12.0,
          fontWeight: FontWeight.w400
        ),),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Add button was clicked");
      },
        tooltip: "Add item",
        child: Icon(Icons.add),
      ),
    ),
    ));
}

  void showSnackBar(BuildContext context, String item) {
    var snackBar = SnackBar(
      content: Text("$item was clicked"),
      action: SnackBarAction(label: "UNDO",onPressed: () {
        debugPrint("Dummy UNDO done!");
      },),  
     );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  


// BASIC LIST VIEW EXAMPLE
// Widget getListView() {
//   var listView = ListView(
//     children: <Widget>[
//       ListTile(
//         leading: Icon(Icons.landscape),
//         title: Text("Landscape"),
//         subtitle: Text("Beautiful landscapes!"),
//         trailing: Icon(Icons.wb_cloudy),
//       ),

//       ListTile(
//         leading: Icon(Icons.phone),
//         title: Text("Contact"),
//         onTap: () {
//           debugPrint("Contact clicked");
//         },
//       ),

//       ListTile(
//         leading: Icon(Icons.computer),
//         title: Text("Windows"),
//       ),

//       Text("Welcome to the contacts app!"),

//       Container(color: Colors.black,padding: EdgeInsets.all(15.0),)
//     ],
//   );

//   return listView;
// }

// LONG LIST VIEW EXAMPLE

// prepare the data 
List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

//convert to widgets
Widget getListView() {

  var listItems = getListElements();
  var listView = ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        onTap: () {
          showSnackBar(context, listItems[index]);
        },
      );
    },
  );

  return listView;
}