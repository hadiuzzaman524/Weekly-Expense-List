import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_expences/models/chart.dart';
import './widgets/cart_element.dart';
import 'listitem.dart';
import './models/transactions.dart';

import 'bottomsheet.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  addItem(String x, double y, DateTime newDate) {
    if (y == null) {
      return;
    }
    var newItem = Transatcions(
        id: DateTime.now().toString(),
        title: x,
        price: y.toInt(),
        dateTime: newDate);
    if (x.isEmpty || y < 1 || newDate == null) {
      return;
    }
    setState(() {
      transactionList.add(newItem);
    });
  }

  List<Transatcions> transactionList = [];

  showModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (btx) {
          return BottomSheetStyle(addItem: addItem);
        });
  }

  /*
  make a list for last 7 days and passing it to Chart widget for building a chart
  for 7 days expense
   */
  List<Transatcions> get recentTransactionList {
    return transactionList.where((element) {
      /*
      here element.dateTime is previous date which store in transactionList then
      after this days current days subtract for get difference of 7
       */
      return element.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  /*
  retrive callback for removing list item
   */
  removeItem(String id) {
    setState(() {
      transactionList.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('My Expenses'),
    );

    return SafeArea(
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
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top)*.3,
                child: WeekChart(
                  resentTransactions: recentTransactionList,
                ),
              ),
              Container(
                height:  (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top)*.7,
                child: ListViewItem(
                  transactionList: transactionList,
                  removeItem: removeItem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
