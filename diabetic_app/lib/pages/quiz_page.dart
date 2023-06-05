import 'dart:math';

import 'package:diabetic_app/my_classes/quiz_question.dart';
import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizController quizController = QuizController();
  List<QuizQuestion> questions  = [];

  int showedQuestions = 0;

  @override
  void initState(){
    super.initState();
    loadQuestionsFromJSON();
  }

  void loadQuestionsFromJSON(){
    quizController.readJSONFromFile(1);
    questions = quizController.generateOptionWidgets(3);
  }

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white70,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(questions[1].question),
          questions[1].quizOptions[0],
          questions[1].quizOptions[1],
        ],
      ),
    );
  }

}
