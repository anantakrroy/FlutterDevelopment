import 'package:flutter/material.dart';

class CurrencySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return dropDownCurrency();
  }
}

class dropDownCurrency extends State<CurrencySelector> {
  var _currency = ['Rupee', 'USD', 'GBP', 'Others'];
  var currentItemSelected = 'Rupee';



  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: _currency.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
      );
    }).toList(),

        onChanged: (String currencySelected) {
          setState(() {
            this.currentItemSelected = currencySelected;
          });
        },
        value: currentItemSelected,
        ); 
  }
}