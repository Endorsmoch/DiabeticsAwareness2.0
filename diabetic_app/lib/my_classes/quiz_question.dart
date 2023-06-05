import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:flutter/material.dart';

class QuizQuestion {
  String question = '';
  List<QuizOptionWidget> quizOptions;

  QuizQuestion({required this.question, required this.quizOptions});


}
/*void main() {
  QuizOptionWidget option1 = QuizOptionWidget(text: 'Option 1', isCorrect: false);
  QuizOptionWidget option2 = QuizOptionWidget(text: 'Option 2', isCorrect: true);
  QuizOptionWidget option3 = QuizOptionWidget(text: 'Option 3', isCorrect: false);

  QuizQuestion question = QuizQuestion(
    question: 'What is your favorite color?',
    quizOptions: [option1, option2, option3],
  );

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            question.quizOptions[0],
            SizedBox(height: 20),
            question.quizOptions[1],
            SizedBox(height: 20),
            question.quizOptions[2],
          ],
        ),
      ),
    ),
  ));
}*/