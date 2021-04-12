import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'URL'),
            controller: _amountController,
            //   onChanged: (value) => amountInput = value,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Container(height: 20),
          RaisedButton(
            child: Text('Add Pokemon'),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: _submitData,
          )
        ]),
      ),
    ));
  }
}
