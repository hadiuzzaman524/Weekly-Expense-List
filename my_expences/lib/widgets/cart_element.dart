import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartElements extends StatelessWidget {
  final price;
  final title;
  final date;
  final id;
  final Function findId;

  CartElements(
      {@required this.title,
      @required this.price,
      @required this.id,
      @required this.date,
      @required this.findId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.cyan,
              child: FittedBox(
                child: Text(
                  '${price.toString()}৳',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              title.toString().toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(date).toString(),
            ),
            trailing: IconButton(
              onPressed: (){
               findId(id);
              },
                icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            )),
          ),
        ),
      ),
    );
  }
}
/*
Container(
padding: EdgeInsets.all(10.0),
child: Row(
children: [
Container(
padding: EdgeInsets.all(15.0),
decoration: BoxDecoration(
border: Border.all(
color: Colors.purpleAccent,
width: 3.0,
),
),
child: Text(
price.toString(),
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize:17,
color: Colors.purpleAccent,
),
),
),
SizedBox(
width: 20.0,
),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title.toString(),
style: TextStyle(
fontSize: 22,
color: Colors.purpleAccent,
),
),
Text(DateFormat.yMMMd().format(date).toString()),
],
)
],
),
),*/
