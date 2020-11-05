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
    return LayoutBuilder(
      /*
      Here LayoutBuilder help us measure dynamically height and width with
      his consstrains property,
       */
      builder: (context, constrains) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${amount.toString()}৳',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height:constrains.minHeight*.04,
            ),
            Container(
              height: constrains.maxHeight*.5,
              width: 16,
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
              height:constrains.minHeight*.04,
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
      },
    );
  }
}
