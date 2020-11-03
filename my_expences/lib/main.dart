import 'package:flutter/material.dart';
import './widgets/cart_element.dart';
import './models/transactions.dart';
import 'package:date_time_format/date_time_format.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    Transatcions(
      id: DateTime.now().toString(),
      title: 'Buy a Coat',
      price: 400,
      dateTime: DateTime.now(),
    ),
    Transatcions(
      id: DateTime.now().toString(),
      title: 'Buy a Coat',
      price: 400,
      dateTime: DateTime.now(),
    ),
  ];


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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {

              showModalBottomSheet(context: context, builder: (context) => Text('hello'));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            title: Text('My Expenses'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.green,
                child: Text('hello world'),
              ),
              Container(
                height: 300.0,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CartElements(
                      id: transactionList[index].id,
                      title: transactionList[index].title,
                      price: transactionList[index].price,
                      date: transactionList[index]
                          .dateTime
                          .format(DateTimeFormats.american),
                    );
                  },
                  itemCount: transactionList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
