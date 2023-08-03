import 'package:flutter/material.dart';
import 'package:tempo/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'How many Colors in a rainbow?',
        'answers': [
          {'text': '5', 'score': 0},
          {'text': '3', 'score': 0},
          {'text': '10', 'score': 0},
          {'text': '7', 'score': 1},
        ],
      },
      {
        'questionText': 'Who\'s the fastest animal?',
        'answers': [
          {'text': 'lion', 'score': 0},
          {'text': 'dog', 'score': 0},
          {'text': 'cheetah', 'score': 1},
          {'text': 'horse', 'score': 0},
        ],
      },
      {
        'questionText': 'What\'s the capital of India',
        'answers': [
          {'text': 'Mumbai', 'score': 0},
          {'text': 'Delhi', 'score': 1},
          {'text': 'Chennai', 'score': 0},
          {'text': 'Kolkata', 'score': 0},
        ],
      },
      {
        'questionText': 'What comes after Monday',
        'answers': [
          {'text': 'Sunday', 'score': 0},
          {'text': 'friday', 'score': 0},
          {'text': 'Tuesday', 'score': 1},
          {'text': 'wednesday', 'score': 0},
        ],
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Quiz App',
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
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
