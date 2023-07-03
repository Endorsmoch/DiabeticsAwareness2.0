import 'package:diabetic_app/pages/quiz_lobby_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_classes/auth.dart';

class CongratsCardWidget extends StatelessWidget{

  final User? user = Auth().currentUser;
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

  Widget _facebookButton(context) {
    return ElevatedButton(
      onPressed: () => shareWithFacebook(this.level, context),
      child: Text(
          'Compartir en Facebook'
      ),
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
                user != null? _facebookButton(context) : SizedBox(),
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