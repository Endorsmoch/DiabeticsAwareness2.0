import 'dart:math';

import 'package:flutter/material.dart';
import 'package:diabetic_app/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions  = [];
  List<String> correctOpts = [];
  List<List<String>> incorrectOpts = [];

  int showedQuestions = 0;

  @override
  void initState(){
    super.initState();
    loadQuestionsFromJSON();
  }

  void loadQuestionsFromJSON() {
    readJSONFromFile(1);

    if (questions.length >= 3) {
      var random = new Random();
      int random
    }
  }
}
