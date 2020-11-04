import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final amount;
  final name;
  final percentage;

  ChartItem({this.amount, this.name, this.percentage});

  @override
  Widget build(BuildContext context) {

    //print(percentage);
    return Column(
      children: [
        Text(
          '${amount.toString()}৳',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 70,
          width: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: percentage == 0 ? 0 : percentage,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name.toString(),
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
