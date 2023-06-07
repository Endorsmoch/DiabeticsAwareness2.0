import 'dart:math';

import 'package:diabetic_app/my_classes/quiz_question.dart';
import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/controllers/quiz_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizController quizController = QuizController();
  List<QuizQuestion> questions = [];
  QuizQuestion pickedQuestion = QuizQuestion.empty();

  bool gameStarted = false;

  @override
  void initState(){
    super.initState();
  }

  void startQuiz() async {
    await quizController.readJSONFromFile(1);
    questions = quizController.generateOptionWidgets(3);
    setState(() {
      gameStarted = true;
      pickQuestion();
    });
  }

  void pickQuestion() {
    try{
      if(questions.isNotEmpty) {
        var random = Random();
        int selected = random.nextInt(questions.length);
        pickedQuestion = questions[selected];
        questions.removeAt(selected);
      }
    } catch(e) {
      print('Exception on pickQuestion: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido al Quiz!'),
      ),
      body: Column(
        children: [
          gameStarted ? Container(
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              alignment: Alignment.center,
              child: Text(questions[0].question),
            ),
          ) : Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: startQuiz,
              child: SizedBox(
                width: 100,
                height: 70,
                child: Text('Iniciar Quiz'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _streetPaint(){
    return Container(
      width: 70,
      height: 20,
      color: Colors.yellow,
    );
  }

  Widget _streetBox(){
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.grey,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Column(
            children: [_streetPaint()],
          ),
          Column(
            children: [_streetPaint()],
          ),
          Column(
            children: [_streetPaint()],
          )
        ],
      ),
    );
  }

  Widget _quizBackgroundLayout(){
    return SizedBox(
      child: Column(
        children: [
          Row(),
          Row(
            children: [_streetBox()],
          ),
          Row(),
          Row(
            children: [_streetBox()],
          ),
          Row(),
          Row(
            children: [_streetPaint()],
          ),
          Row(),
        ],
      ),
    );
  }
}
