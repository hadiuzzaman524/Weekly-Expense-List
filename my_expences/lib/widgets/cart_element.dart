import 'package:flutter/material.dart';

class CartElements extends StatelessWidget {
  final price;
  final title;
  final date;
  final id;

  CartElements({@required this.title,@required this.price,@required this.id,@required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 3.0,
                ),
              ),
              child: Text(
                price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(date.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
