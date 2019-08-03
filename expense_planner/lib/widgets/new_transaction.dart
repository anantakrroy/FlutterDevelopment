import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredText = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      print('Enter valid title and amount');
      return;
    }

    widget.addNewTx(enteredText, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((dateSelected) {
      setState(() {
        _selectedDate = dateSelected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Picked date: ${DateFormat.yMMMd().format(_selectedDate)}',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            RaisedButton(
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
