import 'package:flutter/material.dart';
import './widgets/cart_element.dart';
import 'listitem.dart';
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
/*  String title;
  String amount;*/
  ListItem itemAdd = ListItem();

  addItem(String title, String id, double price, DateTime dateTime) {
    var newItem =
        Transatcions(id: id, title: title, price: price, dateTime: dateTime);
    transactionList.add(newItem);
    print(title);
    print(price);

    print(transactionList.length);
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
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (context) => Container());
              },
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
                Card(
                  color: Colors.green,
                  child: Text('hello world'),
                ),
                Card(
                  child: BottomSheetStyle(
                    addItem: (title,amount) {
                   /*   setState(() {
                        addItem(title, DateTime.now().toString(),
                            double.parse(amount), DateTime.now());
                      });*/
                      // print(ListItem().transactionList.length);
                      print('add called');
                      print(title);
                      print(amount);

                    },
                  ),
                ),
                Container(
                  height: 300.0,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var list = transactionList[index];
                      return CartElements(
                        id: list.id,
                        title: list.title,
                        price: list.price,
                        date: list.dateTime.format(DateTimeFormats.american),
                      );
                    },
                    itemCount: transactionList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetStyle extends StatelessWidget {
  final Function addItem;

  BottomSheetStyle({this.addItem});
  String title;
  var amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffededed),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontSize: 17,
              ),
              onChanged: (value) {
                title = value;
              }),
          SizedBox(
            height: 5.0,
          ),
          TextField(
              decoration: InputDecoration(
                hintText: 'amount',
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 17,
              ),
              onChanged: (value) {
                amount = value;
              }),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed:(){
              addItem({title,amount});
            },
            child: Text(
              'Add Item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
