import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetStyle extends StatefulWidget {
  final Function addItem;

  BottomSheetStyle({this.addItem});

  @override
  _BottomSheetStyleState createState() => _BottomSheetStyleState();
}

class _BottomSheetStyleState extends State<BottomSheetStyle> {
  final titelText = TextEditingController();

  final amountText = TextEditingController();

  DateTime newDate;

  showDate(BuildContext ctx) async {
    var x = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    );
    if (x == null) {
      return;
    }
    setState(() {
      newDate = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 17,
              ),
              controller: titelText,
            ),
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
              controller: amountText,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: newDate == null
                      ? Text('No Choosen Date')
                      : Text(
                          DateFormat.yMMMd().format(newDate).toString(),
                        ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      showDate(context);
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                try {
                  widget.addItem(titelText.text.toString(),
                      double.parse(amountText.text), newDate);
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
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
      ),
    );
  }
}
