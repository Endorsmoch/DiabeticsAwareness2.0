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
  bool gameStarted = false;

  int showedQuestions = 0;

  @override
  void initState(){
    super.initState();
  }

  //Se esperará a que se carguen las preguntas antes de cargar el arreglo con los Widgets.
  /*Future<List<QuizQuestion>> loadQuestionsFromJSON() async {
    quizController.readJSONFromFile(1);
    return quizController.generateOptionWidgets(3);
  }*/

  void startQuiz() async {
     await quizController.readJSONFromFile(1);
    questions = quizController.generateOptionWidgets(3);
    setState(() {
      gameStarted = true;
    });
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
            alignment: Alignment.topCenter,
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
}
