import 'package:flutter/material.dart';

class TextManager extends StatefulWidget 

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextManagerState();
  }
}

class _TextManagerState extends State<TextManager> {

  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text('Hello! Click button to change this text to one of your choice'),
        RaisedButton(
          child: Text('Click me'),
          onPressed: () {
            ;
          },
        )
      ],
    );
  }
}
