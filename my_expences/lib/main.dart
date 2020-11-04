import 'package:flutter/material.dart';
import 'package:my_expences/models/chart.dart';
import './widgets/cart_element.dart';
import 'listitem.dart';
import './models/transactions.dart';

import 'bottomsheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  addItem(String x, double y) {
    var newItem = Transatcions(
        id: DateTime.now().toString(),
        title: x,
        price: y.toInt(),
        dateTime: DateTime.now());
    if (x.isEmpty || y < 1) {
      return;
    }
    setState(() {
      transactionList.add(newItem);
    });
  }

  List<Transatcions> transactionList = [
    Transatcions(
      id: DateTime.now().toString(),
      title: 'Buy a Pant',
      price: 400,
      dateTime: DateTime.now(),
    ),
    Transatcions(
      id: DateTime.now().toString(),
      title: 'Buy a Shart',
      price: 400,
      dateTime: DateTime.now(),
    ),
  ];

  showModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (btx) {
          return BottomSheetStyle(addItem: addItem);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.cyan,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              backgroundColor: Colors.cyan,
              onPressed: () => showModalSheet(context),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('My Expenses'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WeekChart(
                  resentTransactions: transactionList,
                ),
                ListViewItem(transactionList: transactionList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
