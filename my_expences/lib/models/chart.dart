import 'package:flutter/material.dart';
import 'package:my_expences/models/transactions.dart';
import 'package:intl/intl.dart';
import 'package:my_expences/widgets/chart_item.dart';

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

  double get percentang {
    double total = 0;
    for (var i in recentList) {
      total += i['amount'];
      print((i['amount'] as double) / total);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5.0),
        color: Color(0xffededed),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...recentList.map((e) {
              final double x = e['amount'];
              return ChartItem(
                amount: x.toStringAsFixed(0),
                name: e['day'].toString(),
                percentage: e['amount'] == 0
                    ? 0
                    : (((e['amount'] as double) / percentang) * 100),
              );
            }),
          ],
        ),
      ),
    );
  }
}
