import 'package:flutter/material.dart';
import 'package:calculator_si/methods/currency.dart';

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "SI form",
      home: Scaffold(
        // backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Image(
                alignment: Alignment.center,
                width: 500.0,
                height: 125.0,
                image: AssetImage('images/calculator_icon.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter amount invested',
                  labelText: "Principal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                // controller: TextEditingController(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter the return percentage',
                    labelText: 'Return Percentage',
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter time period',
                            labelText: 'Time period',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero)),
                      ),
                    ),
                  ),
                  CurrencySelector(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      elevation: 2.0,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Calculate'),
                      onPressed: () {
                        debugPrint('Calculate button pressed');
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightGreen,
                      elevation: 2.0,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Reset'),
                      onPressed: () {
                        debugPrint('Reset button pressed');
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        )),
    );
  }
}