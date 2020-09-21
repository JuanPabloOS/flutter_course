import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 7},
        {'text': 'Blue', 'score': 8},
        {'text': 'White', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pasta', 'score': 5},
        {'text': 'Pizza', 'score': 3},
        {'text': 'Ice-cream', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 5},
        {'text': 'Horse', 'score': 555}
      ]
    },
  ];
  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz(){
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }
  void _answerQuestion(score) {
    print("score: ");
    print(score);
    _totalScore += score;
    setState(() {
      print("new index: ");
      _questionIndex += 1;
      print(_questionIndex);
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QuizApp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

