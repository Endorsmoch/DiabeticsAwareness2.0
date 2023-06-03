import 'package:flutter/material.dart';

class CorrectOptionWidget extends StatefulWidget {
  final String text;
  final Color baseColor = Color(0xFFE0E0E0);

  CorrectOptionWidget({required this.text});

  @override
  _CorrectOptionWidgetState createState() => _CorrectOptionWidgetState();

}

class _CorrectOptionWidgetState extends State<CorrectOptionWidget> {
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
          color: isPressed ? Colors.lightGreenAccent : widget.baseColor,
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
