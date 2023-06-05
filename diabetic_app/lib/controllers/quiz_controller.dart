import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:diabetic_app/my_classes/quiz_question.dart';


class QuizController {
  List<String> questions = [];
  List<String> correctOpts = [];
  List<List<String>> incorrectOpts = [];
  List<QuizQuestion> quizQuestions = [];

  void readJSONFromFile(int level) {
    try {

      File quizFile = File('lib/lvl_questions/Preguntas_$level.txt');
      String jsonString = quizFile.readAsStringSync();

      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      List<dynamic> questionsList = jsonData['preguntas'];

      for (var question in questionsList) {
        questions.add(question['texto']);
        correctOpts.add(question['respuestas']['correcta']);
        incorrectOpts.add(
            List<String>.from(question['respuestas']['incorrectas'])
        );
      }

      for (int i = 0; i < 6; i++){
        print('Pregunta: $i');
        print(questions[i]);
      }

    } catch(e) {
      print('Exception catched: $e');
    }
  }

  List<QuizQuestion> generateOptionWidgets(int numQuestions) {
    try {

      //Ciclo en el que se seleccionan aleatoriamente 'n=options' preguntas y sus respectivas opciones y se preparan los widgets
      for (int i = 0; i < numQuestions; i++){
        List<QuizOptionWidget> optsWidgets = [];
        var random = new Random();

        //Lo siguiente se hace por si los archivos JSON tienen cantidad de preguntas distintas.
        int randomNum = random.nextInt(questions.length); //Se elige un valor entre 0 - el tamaño del arreglo de preguntas.

        optsWidgets.add(QuizOptionWidget(text: correctOpts[randomNum], isCorrect: true)); //Agregamos la opción correcta.

        //Agregamos las opciones incorrectas
        for(int j = 0; j < incorrectOpts[randomNum].length; j++){
          optsWidgets.add(QuizOptionWidget(text: incorrectOpts[randomNum][j], isCorrect: false));
        }

        //Creamos el objeto de la pregunta con sus respectivos Widgets de opción.
        quizQuestions.add(QuizQuestion(question: questions[randomNum], quizOptions: optsWidgets));
      }

    } catch(e) {
      print('Exception catched: $e');
    }
    return quizQuestions;
  }

}




