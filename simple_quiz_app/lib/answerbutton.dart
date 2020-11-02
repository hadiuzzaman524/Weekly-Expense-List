import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final answer;
  final Function onPress;

  AnswerButton({this.answer, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPress,
        color: Colors.pink,
        child: Text(
          answer,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
