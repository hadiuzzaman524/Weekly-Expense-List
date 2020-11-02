import 'package:flutter/material.dart';
import 'answerbutton.dart';
import 'questions.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  int ansIndex=1;

  var model = [
    {'question': 'What is your favorite color?'},
    {
      'answer': ['black', 'blue', 'green', 'yellow']
    },
    {'question': 'What is your favorite animal?'},
    {
      'answer': ['cow', 'dog', 'cat', 'hourse']
    },
    {'question': 'What is your favorite flower?'},
    {
      'answer': ['rose', 'lotus', 'shimul', 'sewli']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: 50,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Question(
                  question: model[index]['question'],
                ),
                ...(model[ansIndex]['answer'] as List<String>).map((e) {
                  return AnswerButton(
                    answer: e,
                    onPress: () {
                      setState(() {
                        if (model.length-2 > ansIndex) {
                          index+=2;
                          print(index);
                          ansIndex+=2;
                          print(ansIndex);
                          print(model.length);
                        }
                        else{
                          print('call');
                        }
                      });
                      print(e);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
