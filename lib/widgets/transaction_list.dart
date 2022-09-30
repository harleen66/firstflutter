import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                )),
                padding: EdgeInsets.all(15),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //tx.amount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    // tx.date.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ]),
          );
        },

        itemCount: transactions.length,
        //  child: Column(
        // return ListView(
        // children: transactions.map((tx) {}).toList(),
      ),
    );
    // );
  }
}
