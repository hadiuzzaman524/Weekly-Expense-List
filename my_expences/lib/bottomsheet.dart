import 'package:flutter/material.dart';

class BottomSheetStyle extends StatelessWidget {
  final Function addItem;

  BottomSheetStyle({this.addItem});

  final titelText=TextEditingController();
  final amountText=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffededed),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          RaisedButton(
            onPressed: () {
              print(titelText.text);
              print(amountText.text);
              addItem(titelText.text.toString(), double.parse(amountText.text));
              Navigator.pop(context);

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
    );
  }
}
