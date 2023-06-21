import 'package:flutter/material.dart';
import 'package:diabetic_app/pages/login_register_page.dart';
import 'package:diabetic_app/pages/quiz_lobby_page.dart';

class MenuButtonWidget extends StatefulWidget {
  @override
  State createState() => _MenuButtonWidgetState();

}

class _MenuButtonWidgetState extends State<MenuButtonWidget>{

  void onPressed() {

  }

  void quizButtonPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizLobbyPage())
    );
  }
  //Espacio para los demás métodos de acción de los botones restantes

  void loginButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () => quizButtonPressed(context),
            child: Text('Quiz'),
          ),
        ),
        PopupMenuItem(child: Row(children: [
          Text('Opción 1'),
        ],),),
        PopupMenuItem(child: Row(children: [
          Text('Opción 2'),
        ],),),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () => loginButtonPressed(context),
            child: Text('Iniciar Sesión'),
          )

        ),
      ],
      child: Icon(Icons.menu, size: 36,),
    );
  }
}