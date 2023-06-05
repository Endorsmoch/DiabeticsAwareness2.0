import 'package:flutter/material.dart';

class QuizOptionWidget extends StatefulWidget {
  final String text;
  bool isCorrect;
  final Color baseColor = Color(0xFFE0E0E0);
  Color changeColor = Colors.white;

  QuizOptionWidget({required this.text, required this.isCorrect})
      : changeColor = isCorrect ? Colors.lightGreenAccent :  Colors.redAccent;

  @override
  _QuizOptionWidgetState createState() => _QuizOptionWidgetState();

}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  bool isPressed = false;

  void onTap() {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isPressed ? widget.changeColor : widget.baseColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}