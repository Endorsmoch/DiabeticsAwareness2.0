import 'package:diabetic_app/pages/quiz_page.dart';
import 'package:flutter/material.dart';

class QuizLobbyPage extends StatefulWidget {
  @override
  State createState() => _QuizLobbyPageState();

}

void startQuiz(BuildContext context, String level) {
  if(level == '1'){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizPage(level: 1))
    );
  } else if(level == '2'){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizPage(level: 2))
    );
  } else {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizPage(level: 3))
    );
  }
}

ElevatedButton quizLevelButton(BuildContext context, String nivel) {

  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      // Estado presionado
      return Colors.red; // Color rojo
    } else if (states.contains(MaterialState.disabled)) {
      // Estado deshabilitado
      return Colors.grey; // Color gris
    }
    // Estado normal
    return Colors.grey; // Color verde
  }

  return ElevatedButton(
      onPressed: () => startQuiz(context, nivel),
      child: SizedBox(
        width: 150,
        height: 70,
        child: Center(
          child:Text(
            'Nivel $nivel',
            style: TextStyle(
                fontSize: 24
            ),
          ),
        ),
      ),
    style: ButtonStyle(
      //backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      backgroundColor:  MaterialStateProperty.resolveWith<Color>(getButtonColor),
    ),
  );
}

class _QuizLobbyPageState extends State<QuizLobbyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text('Selecciona un nivel:',
            style: TextStyle(
                fontSize: 24
            ),
          ),
          SizedBox(height: 80,),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  quizLevelButton(context, '1'),
                  SizedBox(height: 30,),
                  quizLevelButton(context, '2'),
                  SizedBox(height: 30,),
                  quizLevelButton(context, '3'),
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}