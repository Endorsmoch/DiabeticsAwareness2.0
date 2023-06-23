import 'dart:math';

import 'package:diabetic_app/my_classes/quiz_question.dart';
import 'package:diabetic_app/my_widgets/question_card_widget.dart';
import 'package:diabetic_app/my_widgets/quiz_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {

  int level = 0;

  @override
  _QuizPageState createState() => _QuizPageState(level: this.level);

  QuizPage({required this.level});

}

class _QuizPageState extends State<QuizPage> {
  int level = 0;
  QuizController quizController = QuizController();
  List<QuizQuestion> questions = [];
  QuizQuestion pickedQuestion = QuizQuestion.empty();
  List<QuizOptionWidget> optionButtons = [];

  bool gameStarted = false;
  bool showCard = false;

  _QuizPageState({required this.level});

  @override
  void initState(){
    super.initState();
    loadQuiz(level);
  }

  void loadQuiz(int level) async {
    await quizController.readJSONFromFile(level);
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
        this.optionButtons = buildOptionButtons(pickedQuestion.correctOpt, pickedQuestion.incorrectOpts);
      }
    } catch(e) {
      print('Exception on pickQuestion: $e');
    }
  }

  List<QuizOptionWidget> buildOptionButtons(String correctOpt, List<String> incorrectOpts){
    List<QuizOptionWidget> options = [];

    //Crear botón de la opción correcta
    options.add(QuizOptionWidget(text: correctOpt, isCorrect: true, onTapFn: () => optionSelected(true)));

    //Crear botones de las opciones incorrectas
    for(int i = 0 ;i < incorrectOpts.length; i ++){
      options.add(QuizOptionWidget(text: incorrectOpts[i], isCorrect: false, onTapFn: () => optionSelected(false)));
    }

    return options;
  }

  void _toggleCardVisibility() {
    setState(() {
      showCard = !showCard;
    });
  }

  void optionSelected(bool isCorrect) {

    Future.delayed(Duration(milliseconds: 1500), _toggleCardVisibility);
    if(isCorrect){
      print("Opción Correcta");
    }else{
      print("Opción Incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido al Quiz!'),
      ),
      body: _quizBackgroundLayout(),
    );
  }

  Widget _streetBox(){
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget _grassBox() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _iguana(0),
          ],
        ),
      ),
    );
  }

  Widget _iguana(int whenToAppear){
    return SizedBox(
      height: 50,
      width: 50,
      child: Image(
        image: AssetImage("assets/images/iguana.jpg"),
      ),
    );
  }

  Widget _quizBackgroundLayout(){
    return GestureDetector(
      onTap: _toggleCardVisibility,
      child: Stack(
        children: [
          Column(
            children: [
              _grassBox(),
              _streetBox(),
              _grassBox(),
              _streetBox(),
              _grassBox(),
              _streetBox(),
              _grassBox()
            ],
          ),
          if (showCard)
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: QuestionCardWidget(pickedQuestion.question, optionButtons),
              ),
            ),
        ],
      ),
    );
  }
}
