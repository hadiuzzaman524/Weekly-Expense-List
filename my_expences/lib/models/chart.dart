import 'package:flutter/material.dart';
import 'package:my_expences/models/transactions.dart';
import 'package:intl/intl.dart';

class WeekChart extends StatelessWidget {
  final List<Transatcions> resentTransactions;

  WeekChart({this.resentTransactions});


  List<Map<String, Object>> get recentList {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0;
      for (var i in resentTransactions) {
        if (i.dateTime.day == weekDay.day &&
            i.dateTime.month == weekDay.month &&
            i.dateTime.year == weekDay.year) {
          total += i.price;
        }
      }

      /*
      DateFormat.E().format(weekDay) return Day name that's why we use it.
       */
      return {'day': DateFormat.E().format(weekDay), 'amount': total};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(recentList);
    return Container(
      color: Colors.red,
      height: 200,
    );
  }
}
