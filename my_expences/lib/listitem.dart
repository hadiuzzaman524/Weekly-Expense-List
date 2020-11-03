import 'package:flutter/material.dart';
import './models/transactions.dart';
import './widgets/cart_element.dart';
import 'package:date_time_format/date_time_format.dart';

class ListViewItem extends StatelessWidget {
  ListViewItem({
    @required this.transactionList,
  });

  final List<Transatcions> transactionList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
