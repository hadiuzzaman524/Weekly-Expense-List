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
  int ansIndex = 1;

  var score = 0;

  var model = [
    {
      'question': ['What is your favorite color?', 'blue']
    },
    {
      'answer': ['black', 'blue', 'green', 'yellow']
    },
    {
      'question': ['What is your favorite animal?', 'cow']
    },
    {
      'answer': ['cow', 'dog', 'cat', 'hourse']
    },
    {
      'question': ['What is your favorite flower?', 'rose']
    },
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
                  question: model[index]['question'][0],
                ),
                ...(model[ansIndex]['answer']).map(
                  (e) {
                    return AnswerButton(
                      answer: e,
                      onPress: () {
                        var x;
                        setState(() {
                          x = model[index]['question'][1];
                          if (model.length - 2 > ansIndex) {
                            index += 2;

                            ansIndex += 2;
                          } else {}
                        });

                        if (x == e) {
                          score += 10;
                        }
                      },
                    );
                  },
                ),
                Text(
                  'Score: ${score}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
