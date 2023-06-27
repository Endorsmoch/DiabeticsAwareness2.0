import 'package:diabetic_app/pages/quiz_lobby_page.dart';
import 'package:flutter/material.dart';

class CongratsCardWidget extends StatelessWidget{

  int level = 0;

  CongratsCardWidget({required this.level});

  void shareWithFacebook(int level, BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizLobbyPage())
    );
  }

  void goBackToQuizMenu(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizLobbyPage())
    );
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("¡Felicidades!\n Completaste exitosamente el nivel.",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: () => shareWithFacebook(this.level, context),
                  child: Text(
                      'Compartir en Facebook'
                  ),
                ),
                GestureDetector(
                  onTap: () => goBackToQuizMenu(context),
                  child: Text("Regresar al menú"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}