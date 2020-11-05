import 'package:flutter/material.dart';
import './models/transactions.dart';
import './widgets/cart_element.dart';
import 'package:intl/intl.dart';

class ListViewItem extends StatelessWidget {

  final Function removeItem;
  ListViewItem({
    @required this.transactionList,
    @required this.removeItem,
  });

  final List<Transatcions> transactionList;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          var list = transactionList[index];
          return CartElements(
            id: list.id,
            title: list.title,
            price: list.price,
            date: list.dateTime,
            findId: removeItem,
          );
        },
        itemCount: transactionList.length,
    );
  }
}
