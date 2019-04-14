import 'package:flutter/material.dart';
import 'package:contacts_app/main.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactListState();
  }
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 0.5),

            ),
            child: Column(children: <Widget>[
              Text(
                "Anil",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                ),
                textAlign: TextAlign.center,
              ),
              Container(margin: EdgeInsets.only(top: 20.0),),
              // Row(crossAxisAlignment: CrossAxisAlignment.stretch,),
              // Divider(color: Colors.black,height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AnimatedContainer(
                    child: Icon(Icons.call, color: Colors.green[800],),
                    duration: Duration(seconds: 3),
                    curve: Curves.bounceOut,
                  ),      
                  Icon(Icons.message, color: Colors.yellow[800],),
                  Icon(Icons.mail, color: Colors.blue[800],)
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
