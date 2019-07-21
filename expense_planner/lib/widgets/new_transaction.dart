import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  void submitData() {
    final enteredText = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      print('Enter valid title and amount');
      return;
    }

    addNewTx(enteredText, enteredAmount);
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
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
              child: Text('Add transaction'),
              color: Colors.purple[100],
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
