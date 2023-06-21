import 'dart:io';

import 'package:diabetic_app/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';

class QuizOptionWidget extends StatefulWidget {
  final String text;
  bool isCorrect;
  final Color baseColor = Color(0xFFE0E0E0);
  Color changeColor;

  QuizOptionWidget({required this.text, required this.isCorrect})
      : changeColor = isCorrect ? Colors.lightGreenAccent :  Colors.redAccent;

  @override
  _QuizOptionWidgetState createState() => _QuizOptionWidgetState();

}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  bool isPressed = false;

  void onTap() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: isPressed ? widget.changeColor : widget.baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
