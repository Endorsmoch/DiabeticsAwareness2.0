import 'package:flutter/material.dart';
import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'dart:math';

class QuestionCardWidget extends StatelessWidget{

  String question = '';
  List<QuizOptionWidget> answerOptions = [];

  QuestionCardWidget(String question, List<QuizOptionWidget> buttons){
    this.question = question;
    this.answerOptions = sortAnswerOptions(buttons);
  }

  List<QuizOptionWidget> sortAnswerOptions(List<QuizOptionWidget> options){
    List<QuizOptionWidget> result = [];

    try{
      List<QuizOptionWidget> availableOptions = List.from(options);

      if (availableOptions.isNotEmpty) {
        for (int i = 0; i < options.length; i++) {
          var random = Random();
          int selected = random.nextInt(availableOptions.length);
          result.add(availableOptions[selected]);
          availableOptions.removeAt(selected);
        }
      }
    }catch(e){
      print('Exception at sortAnswerOptions in QuestionCardWidget: $e');
    }
    return result;
  }
  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(question,
                style: TextStyle(fontSize: 24)
            ),
            SizedBox(height: 20),
            answerOptions[0],
            SizedBox(height: 20),
            answerOptions[1],
            SizedBox(height: 20),
            answerOptions[2],
          ],
        ),
      ),
    );
  }

}