import 'dart:convert';
import 'dart:io';
import 'dart:math';

void readJSONFromFile(int level) {
  File quizFile = File('lib/lvl_questions/Preguntas_$level.txt');
  String jsonString = quizFile.readAsStringSync();

  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  List<String> questions = [];
  List<String> correctOpts = [];
  List<List<String>> incorrectOpts = [];

  List<dynamic> questionsList = jsonData['preguntas'];

  for (var question in questionsList) {
    questions.add(question['texto']);
    correctOpts.add(question['respuestas']['correcta']);
    incorrectOpts.add(List<String>.from(question['respuestas']['incorrectas']));
  }

  for (int i = 0; i < 6; i++){
    print('Pregunta Num: $i:');
    print(questions[i]);
    print(correctOpts[i]);
    for (int j = 0; j < incorrectOpts[i].length; j++){
      print(incorrectOpts[i][j]);
    }
  }
}

void generateOptionWidgets(int options) {
  for (int i = 0; i < options; i++){
    var random = new Random();

  }
}

