import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
// import './widgets/user_transaction.dart';
import './widgets/new_transaction.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'section4',
      theme: ThemeData(primarySwatch: Colors.green, accentColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String titleInput;
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'shoes',
      amount: 43.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'sports shoes',
      amount: 79.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         // backgroundColor: Colors.red,
          title: Text('section4Video73'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.orange,
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            // UserTransaction()
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
