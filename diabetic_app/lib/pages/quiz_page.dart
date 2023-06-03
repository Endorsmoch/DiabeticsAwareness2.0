import 'dart:math';

import 'package:diabetic_app/my_widgets/correct_option_widget.dart';
import 'package:diabetic_app/my_widgets/incorrect_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions  = [];
  List<CorrectOptionWidget> correctOpts = [];
  List<List<IncorrectOptionWidget>> incorrectOpts = [];

  int showedQuestions = 0;

  @override
  void initState(){
    super.initState();
    loadQuestionsFromJSON();
  }


}
