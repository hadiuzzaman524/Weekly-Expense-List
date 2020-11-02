import 'package:flutter/material.dart';

class Question extends StatelessWidget {
 final question;
 Question({this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
