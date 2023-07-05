import 'dart:convert';
import 'dart:math';

import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:diabetic_app/my_classes/quiz_question.dart';
import 'package:diabetic_app/pages/quiz_page.dart';
import 'package:flutter/services.dart';

class QuizController {
  List<String> questions = [];
  List<String> correctOpts = [];
  List<List<String>> incorrectOpts = [];
  List<QuizQuestion> levelQuestions = [];
  List<QuizQuestion> levelQuestionsCopy = [];

  int stage = 0;

  void increaseStage(){
    if(stage < 4){
      this.stage++;
    }
  }

  int getStage(){
    return stage;
  }

  Future<void> readJSONFromFile(int level) async {
    try {
      final String response = await rootBundle.loadString('assets/question_files/preguntas.json');
      final data = await json.decode(response);

      List<dynamic> nivelesList = data['niveles'];
      List<dynamic> questionsList = nivelesList[level-1]['preguntas'];
      for(var question in questionsList){
        questions.add(question['texto']);
        correctOpts.add(question['respuestas']['correcta']);
        incorrectOpts.add(
            List<String>.from(question['respuestas']['incorrectas'])
        );
      }
      buildLevelQuestionsList();
    } catch(e) {
      print('Exception catched: $e');
    }
  }

  void buildLevelQuestionsList(){
    try {
      for(int i = 0; i < questions.length; i++){
        levelQuestions.add(QuizQuestion(question: questions[i], correctOpt: correctOpts[i], incorrectOpts: incorrectOpts[i]));
      }
      levelQuestionsCopy = levelQuestions;
    }catch (e){
      print("Exception in builLevelQuestionsList(): $e");
    }
  }

  QuizQuestion selectQuizQuestion() {
    QuizQuestion deliverableQuestion = QuizQuestion.empty();

    try {
      if(levelQuestionsCopy.isNotEmpty){
        var random = Random();
        int randomNum = random.nextInt(levelQuestionsCopy.length);
        deliverableQuestion = levelQuestionsCopy[randomNum];
        levelQuestionsCopy.removeAt(randomNum);
      }
    } catch(e) {
      print('Exception in selectQuizQuestion: $e');
    }
    return deliverableQuestion;
  }

  void returnQuestion(QuizQuestion returnedQuestion){
    this.levelQuestionsCopy.add(returnedQuestion);
  }


}






