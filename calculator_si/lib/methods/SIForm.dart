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

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:10.0, bottom: 10.0),
              child: Image(
                color: Colors.greenAccent,
                alignment: Alignment.center,
                width: 500.0,
                height: 125.0,
                image: AssetImage('images/calculator_icon.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0, bottom: 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                  hintText: 'Enter amount invested',
                  labelText: "Principal",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // controller: TextEditingController(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    hintText: 'Enter the return percentage',
                    labelText: 'Return Percentage',
                    labelStyle: textStyle,
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        decoration: InputDecoration(
                            hintText: 'Enter time period',
                            labelText: 'Time period',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                  ),

                  Container(width: 50.0),

                  Expanded(
                    child: CurrencySelector(),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorDark,
                      elevation: 2.0,
                      child: Text('Calculate', textScaleFactor: 1.5,),
                      onPressed: () {
                        debugPrint('Calculate button pressed');
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      elevation: 2.0,
                      padding: EdgeInsets.all(5.0),
                      child: Text('Reset', textScaleFactor: 1.5,),
                      onPressed: () {
                        debugPrint('Reset button pressed');
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}