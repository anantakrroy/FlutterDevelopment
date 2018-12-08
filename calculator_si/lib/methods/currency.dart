import 'package:flutter/material.dart';

class CurrencySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _dropDownCurrency();
  }
}

class _dropDownCurrency extends State<CurrencySelector> {
  var _currency = ['Rupee', 'USD', 'GBP', 'Others'];
  var _currentItemSelected = 'Rupee';

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
            this._currentItemSelected = currencySelected;
          });
        },
        value: _currentItemSelected,
        ); 
  }
}