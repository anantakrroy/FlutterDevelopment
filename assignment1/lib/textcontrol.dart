import 'package:flutter/material.dart';

import './text.dart';

class TextControl extends StatefulWidget {

  final String welcomeString;

  TextControl(this.welcomeString);

  @override
  State<StatefulWidget> createState() {
    print('[textControl] create state');
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {

  String _textToDisplay = '';

  @override
  void initState() {
    print('[textControl] init state');
    _textToDisplay = widget.welcomeString;
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    print('[textControl] build');
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Theme.of(context).primaryColorLight,
            splashColor: Theme.of(context).primaryColorDark,
            onPressed: () {
              print('button pressed');
              setState(() {
                print('[textControl] set state called');
                _textToDisplay = 'Welcome to the magic world!';
              });
            },
            child: Text('Magic Button'),
          ),
          TextOutput(_textToDisplay),
        ],
      ),
    );
  }
}
