import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                width: 500.0,
                height: 125.0,
                image: AssetImage('images/calculator_icon.png'),
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter amount invested',
                  labelText: "Principal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                // controller: TextEditingController(),
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the return percentage',
                  labelText: 'Return Percentage',
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero)
                ),
              ),

              Row(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter time period',
                      labelText: 'Time period',
                      border: OutlineInputBorder(borderRadius: BorderRadius.zero)
                    ),
                  ),
                  CurrencySelector()
                ],
              )

            ]
          ),
        )),
  ));
}

class CurrencySelector extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dropDownCurrency();
      
    }
}
    
class _dropDownCurrency extends State<CurrencySelector> {

  var _currency = ['Rupee', 'USD', 'GBP', 'Others'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
      items: 
    );
  }
}

  
