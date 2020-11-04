import 'package:flutter/material.dart';
import 'package:my_expences/models/transactions.dart';

class WeekChart extends StatelessWidget {
  final List<Transatcions> resentTransactions;
  WeekChart({this.resentTransactions});



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
    );
  }
}
